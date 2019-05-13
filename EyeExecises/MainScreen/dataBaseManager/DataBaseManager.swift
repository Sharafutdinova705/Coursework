//
//  DataBaseManager.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift

class DataBaseManager: DataBaseManagerProtocol {
    
    fileprivate lazy var mainRealm: Realm = try! Realm(configuration: .defaultConfiguration)
    
    func clearAll() {
        
        try! mainRealm.write {
            mainRealm.deleteAll()
        }
    }
    
    func saveItem(item: Object) {
        
        try! mainRealm.write {
            mainRealm.add(item)
        }
    }
    
    func updateItem(item: Object) {
        
        try! mainRealm.write {
            mainRealm.add(item, update: true)
        }
    }
    
    func obtainCoins() -> UserModel? {
        
        let items = mainRealm.objects(UserModel.self)
        
        return Array(items).first
    }
    
    func obtainExercises() -> [ExerciseModel] {
        
        let items = mainRealm.objects(ExerciseModel.self)
        
        return Array(items)
    }
    
    func obtainEyesightCheck() -> [EyesightCheckNoteModel] {
        
        let items = mainRealm.objects(EyesightCheckNoteModel.self)
        
        return Array(items)
    }
    
    func obtainUsageDate() -> [UsageDateModel] {
        
        let items = mainRealm.objects(UsageDateModel.self)
        
        return Array(items)
    }
    
    func obtainAchievements() -> [AchievementModel] {
        
        let items = mainRealm.objects(AchievementModel.self)
        
        return Array(items)
    }
    
    func performTransaction(transaction: () -> ()) {
        
        try! mainRealm.write {
            transaction()
        }
    }
}
