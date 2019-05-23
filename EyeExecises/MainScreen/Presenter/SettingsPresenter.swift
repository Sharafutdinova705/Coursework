//
//  SettingsPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 14/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsViewOutput, SettingsInteractorOutput {
    
    var interactor: SettingsInteractorInput!
    var router: SettingsRouterInput!
    
    func clearAllData() {
        interactor.clearAllData()
    }
    
    func showClearAlert() {
        router.showClearAlert()
    }
}
