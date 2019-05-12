//
//  EyesightCheckPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 09/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class EyesightCheckPresenter: EyesightCheckViewOutput {
    
    var view: EyesightCheckViewInput!
    var router: EyesightCheckRouterInput!
    
    //MARK: - EyesightCheckViewOutput
    
    func showNewDataAlert() {
        router.showNewDataAlert()
    }
    
    func showStatistics() {
        router.showStatistics()
    }
}
