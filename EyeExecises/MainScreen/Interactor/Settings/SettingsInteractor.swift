//
//  SettingsInteractor.swift
//  EyeExecises
//
//  Created by Гузель on 14/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class SettingsInteractor: SettingsInteractorInput {
    
    var output: SettingsInteractorOutput!
    var dataBase: DataBaseManagerProtocol!
    
    func clearAllData() {
        dataBase.clearAll()
        initData()
        output.showClearAlert()
    }
    
    func initData() {
        
        if dataBase.obtainCoins() == nil {
            
            let userModel = UserModel()
            userModel.id = 1
            userModel.coin = 0
            dataBase.saveItem(item: userModel)
        }
    }
}
