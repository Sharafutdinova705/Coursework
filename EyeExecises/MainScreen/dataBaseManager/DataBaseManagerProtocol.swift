//
//  DataBaseManagerProtocol.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataBaseManagerProtocol: AnyObject {
    
    func clearAll()
    
    func saveItem(item: Object)
    
    func updateItem(item: Object)
    
    func obtainCoins() -> UserModel?
    
    func obtainExercises() -> [ExerciseModel]
    
    func obtainEyesightCheck() -> [EyesightCheckNoteModel]
    
    func obtainUsageDate() -> [UsageDateModel]
    
    func obtainAchievements() -> [AchievementModel]
    
    func performTransaction(transaction: () -> ())
}
