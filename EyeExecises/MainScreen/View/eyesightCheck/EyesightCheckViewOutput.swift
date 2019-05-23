//
//  EyesightCheckViewOutput.swift
//  EyeExecises
//
//  Created by Гузель on 09/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol EyesightCheckViewOutput: AnyObject {
    
    func showNewDataAlert()
    
    func showStatistics()
    
    func obtainCountOfCoin()
}
