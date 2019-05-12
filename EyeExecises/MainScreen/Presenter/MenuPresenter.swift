//
//  MenuPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 09/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class MenuPresenter: MenuViewOutput {
    
    var view: MenuViewInput!
    var router: MenuRouterInput!
    
    //MARK: - MenuViewOutput
    
    func showExercises() {
        router.showExercises()
    }
    
    func showEyesightCheckPage() {
        router.showEyesightCheckPage()
    }
    
    func showStatisticPage() {
        router.showStatisticPage()
    }
    
    func showAchievements() {
        router.showAchievements()
    }
    
    func showSettings() {
        router.showSettings()
    }
}
