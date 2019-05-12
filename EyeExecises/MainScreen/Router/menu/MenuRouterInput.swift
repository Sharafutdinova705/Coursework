//
//  MenuRouterInput.swift
//  EyeExecises
//
//  Created by Гузель on 09/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol MenuRouterInput: AnyObject {
    
    func showExercises()
    
    func showEyesightCheckPage()
    
    func showStatisticPage()
    
    func showAchievements()
    
    func showSettings() 
}
