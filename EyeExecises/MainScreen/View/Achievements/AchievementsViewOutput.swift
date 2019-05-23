//
//  AchievementsViewOutput.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol AchievementsViewOutput: AnyObject {
    
    func getAllAchievements()
    
    func check(index: Int)
    
    func obtainCountOfCoin()
}
