//
//  SettingsRouter.swift
//  EyeExecises
//
//  Created by Гузель on 14/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class SettingsRouter: SettingsRouterInput {
    
    var output: SettingsRouterOutput!
    var view: UIViewController!
    
    func showClearAlert() {
        
        let alert = UIAlertController(title: "Data cleared", message: "All data cleared, you have 0$", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(ok)
        view.present(alert, animated: true, completion: nil)
    }
}
