//
//  EyesightCheckRouter.swift
//  EyeExecises
//
//  Created by Гузель on 09/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class EyesightCheckRouter: EyesightCheckRouterInput {
    
    var output: EyesightCheckRouterOutput!
    weak var view: UIViewController!
    
    func showNewDataAlert() {
        
        let alert = UIAlertController(title: "Write new data", message: "Write data of left, right and both eyesight", preferredStyle: .alert)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Right eye"
        }
        
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Left eye"
        }
        
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Both eye"
        }
        
        let right = alert.textFields?[0]
        let left = alert.textFields?[1]
        let both = alert.textFields?[2]
        
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            if right?.text == "" || left?.text == "" || both?.text == "" {
                
                self.showEmptyTextFieldAlert()
            } else {
                let eyesightCheckModel = EyesightCheckNoteModel()
                eyesightCheckModel.rightEyesight = Int((right?.text)!)!
                eyesightCheckModel.leftEyesight = Int((left?.text)!)!
                eyesightCheckModel.bothEyesight = Int((both?.text)!)!
                self.output.saveEyesightCheck(eyesightCheck: eyesightCheckModel)
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        view.present(alert, animated: true, completion: nil)
    }
    
    func showStatistics() {
        
        view.performSegue(withIdentifier: "statistic", sender: nil)
    }
    
    func showEmptyTextFieldAlert() {
        
        let alert = UIAlertController(title: "Write all data", message: "Some textField is empty. Write data of left, right and both eyesight", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(ok)
        view.present(alert, animated: true, completion: nil)
    }
}
