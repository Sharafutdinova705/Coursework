//
//  AchievementsInteractorInput.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol AchievementsInteractorInput: AnyObject {
    
    func getAllAchievements()
    
    func checkAchievementIsComplete(index: Int)
    
    func updateCountOfCoin(coin: Int)
    
    func obtainCountOfCoin()
}
