//
//  AchievementsRouterInput.swift
//  EyeExecises
//
//  Created by Гузель on 14/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol AchievementsRouterInput: AnyObject {
    
    func showAlert(title:String, information: String)
    
    func setData(data : Int, information: String, name: String)
}
