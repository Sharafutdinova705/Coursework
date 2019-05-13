//
//  ExercisesInteractor.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class ExercisesInteractor: ExercisesInteractorInput {
    
    var output: ExercisesInteractorOutput!
    var dataBase: DataBaseManagerProtocol!
    var view: UIViewController!
    var apiManager = APIManager(sessionConfiguration: URLSessionConfiguration.default)
    
    func getCountOfCoin() {
        
        let user = dataBase.obtainCoins()
        
        output.initCountOfCoin(count: user?.coin ?? 0)
    }
    
    func updateCountOfCoin(coin: Int) {
        
        let user = dataBase.obtainCoins()
        
        dataBase.performTransaction {
            
            user?.coin = (user?.coin)! - coin
        }
        
        dataBase.updateItem(item: user!)
        output.initCountOfCoin(count: (user?.coin)!)
    }
    
    func updateExercise(exercise: ExerciseModel, index: Int) {
        
        var exercises = dataBase.obtainExercises()
        
        dataBase.performTransaction {
            
            exercises[index] = exercise
        }
        
        dataBase.updateItem(item: exercises[index])
    }
    
    func getLastId() -> Int {
        
        var allId: [Int] = []
        let exercisesArray = dataBase.obtainExercises()
        let eyesightCheckArray = dataBase.obtainEyesightCheck()
        let achievementArray = dataBase.obtainAchievements()
        let usageArray = dataBase.obtainUsageDate()
        let userModel = dataBase.obtainCoins()
        
        allId.append(userModel?.id ?? 1)
        
        for item in exercisesArray {
            allId.append(item.id)
        }
        
        for item in eyesightCheckArray {
            allId.append(item.id)
        }
        
        for item in achievementArray {
            allId.append(item.id)
        }
        
        for item in usageArray {
            allId.append(item.id)
        }
        
        return allId.max() ?? 0
    }
    
    func getAllExercises() {
        
        getCountOfCoin()
        var exercises = dataBase.obtainExercises()
        
        if exercises == [] {
            
            apiManager.fetchResultWith() { (result) in
                
                switch result {
                    
                case .success(let foundedItem):
                    
                    for _ in foundedItem {
                        
                        let exerciseModel = ExerciseModel()
                        exerciseModel.id = self.getLastId() + 1
                        exerciseModel.name = "Buy for 500$"
                        exerciseModel.information = ""
                        exerciseModel.url = ""
                        exercises.append(exerciseModel)
                        self.dataBase.saveItem(item: exerciseModel)
                    }
                    
                case .failure(let error):
                    
                    print(error.localizedDescription)
                }
            }
        }
        
        self.output.updateExercisesArray(array: exercises)
    }
    
    func buyExercise(index: Int, array: [ExerciseModel]) {
        
        var exercises = array
        apiManager.fetchResultWith() { (result) in
            
            switch result {
            case .success(let foundedItems):
                let exerciseModel = ExerciseModel()
                exerciseModel.id = exercises[index].id
                exerciseModel.name = ""
                exerciseModel.information = foundedItems[index].titleLabel
                exerciseModel.url = foundedItems[index].imagepath
                exercises[index] = exerciseModel
                self.updateCountOfCoin(coin: 500)
                self.updateExercise(exercise: exerciseModel, index: index)
                self.output.updateExercisesArray(array: exercises)
                self.view.performSegue(withIdentifier: "toExerciseDetailVC", sender: index)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
