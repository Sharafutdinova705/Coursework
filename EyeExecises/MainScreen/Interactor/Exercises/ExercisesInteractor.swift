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
                NotificationCenter.default.post(name: NSNotification.Name("buyExercise"), object: nil)
                self.view.performSegue(withIdentifier: "toExerciseDetailVC", sender: index)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
