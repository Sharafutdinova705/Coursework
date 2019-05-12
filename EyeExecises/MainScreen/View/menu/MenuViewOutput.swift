//
//  MenuViewOutput.swift
//  EyeExercises
//
//  Created by Гузель on 08/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol MenuViewOutput: AnyObject {
    
    func showExercises()
    
    func showEyesightCheckPage()
    
    func showStatisticPage()
    
    func showAchievements()
    
    func showSettings() 
}
