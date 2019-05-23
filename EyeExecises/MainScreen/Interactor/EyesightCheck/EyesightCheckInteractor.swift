//
//  EyesightCheckInteractor.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class EyesightCheckInteractor: EyesightCheckInteractorInput {
    
    var output: EyesightCheckInteractorOutput!
    var dataBase: DataBaseManagerProtocol!
    
    func obtainCountOfCoin() {
        output.updateCountOfCoin(coin: dataBase.obtainCoins()?.coin ?? 0)
    }
    
    func saveEyesightCheck(eyesightCheck: EyesightCheckNoteModel) {
        eyesightCheck.id = getLastId() + 1
        eyesightCheck.date = Date()
        dataBase.saveItem(item: eyesightCheck)
        print(dataBase.obtainEyesightCheck())
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
}
