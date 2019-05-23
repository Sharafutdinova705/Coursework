//
//  AchievementsInteractorOutput.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol AchievementsInteractorOutput: AnyObject {
    
    func updateAchievements(achievements: [AchievementModel])
    
    func setData(data : Int, information: String, name: String)
    
    func showAlert(title:String, information: String)
    
    func updateCountOfCoinInView(coin: Int)
}
