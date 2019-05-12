//
//  MenuRouter.swift
//  EyeExecises
//
//  Created by Гузель on 09/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class MenuRouter: MenuRouterInput {
    
    var output: MenuRouterOutput!
    weak var view: UIViewController!
    
    func showExercises() {
        
    }
    
    func showEyesightCheckPage() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "eyesightcheck") as! EyesightCheckViewController
        
        //view.show(vc, sender: nil)
        view.present(vc, animated: true, completion: nil)
    }
    
    func showStatisticPage() {
        
    }
    
    func showAchievements() {
        
    }
    
    func showSettings() {
        
    }
}
