//
//  AchievementsRouter.swift
//  EyeExecises
//
//  Created by Гузель on 14/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class AchievementsRouter: AchievementsRouterInput {
    
    var output: AchievementsRouterOutput!
    var view: UIViewController!
    
    func setData(data : Int, information: String, name: String) {
        
        let alert = UIAlertController(title: name, message: information, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Get " + String(data) + "$", style: .default) { (action) in
            self.output.updateCountOfCoin(coin: data)
        }
        
        alert.addAction(ok)
        view.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, information: String) {
        
        let alert = UIAlertController(title: title, message: information, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(ok)
        view.present(alert, animated: true, completion: nil)
    }
}
