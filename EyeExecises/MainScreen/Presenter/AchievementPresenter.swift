//
//  AchievementPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class AchievementPresenter: AchievementsInteractorOutput, AchievementsViewOutput, AchievementsRouterOutput {

    var interactor: AchievementsInteractorInput!
    var view: AchievementsViewInput!
    var router: AchievementsRouterInput!
    
    func getAllAchievements() {
        
        interactor.getAllAchievements()
    }
    
    func updateAchievements(achievements: [AchievementModel]) {
        
        view.updateAchievements(achievements: achievements)
    }
    
    func check(index: Int) {
        interactor.checkAchievementIsComplete(index: index)
    }
    
    func setData(data : Int, information: String, name: String) {
        router.setData(data: data, information: information, name: name)
    }
    
    func showAlert(title:String, information: String) {
        router.showAlert(title: title, information: information)
    }
    
    func updateCountOfCoin(coin: Int) {
        interactor.updateCountOfCoin(coin: coin)
    }
    
    func updateCountOfCoinInView(coin: Int) {
        view.updateCountOfCoin(coin: coin)
    }
    
    func obtainCountOfCoin() {
        interactor.obtainCountOfCoin()
    }
}
