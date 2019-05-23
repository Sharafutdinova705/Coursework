//
//  ExercisesRouter.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class ExercisesRouter: ExercisesRouterInput {
    
    var output: ExercisesRouterOutput!
    var view: UIViewController!
    
    func showBuyingAlert(cell: ExercisesTableViewCell, index: Int, currentCountOfCoin: Int) {
        
        if cell.hiddenExerciseView.isHidden {
            view.performSegue(withIdentifier: "toExerciseDetailVC", sender: index)
        } else {
            let alert = UIAlertController(title: "Buy for 500$", message: "You can buy this exercise for 500$", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
                if currentCountOfCoin >= 500 {
                    self.output.buyExercise(index: index)
                } else {
                    let noMoneyAlert = UIAlertController(title: "Sry you poor", message: "You haven't enough money to buy this exercise", preferredStyle: .alert)
                    let okay = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    noMoneyAlert.addAction(okay)
                    self.view.present(noMoneyAlert, animated: true, completion: nil)
                }
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            view.present(alert, animated: true, completion: nil)
        }
    }
}
