//
//  MainScreenViewController.swift
//  EyeExecises
//
//  Created by Гузель on 16/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, MainScreenViewInput {
    
    var output: MainScreenViewOutput!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuButtonPressed"), object: nil)
    }
    
    @IBAction func startExercisesAsVideo(_ sender: Any) {
        performSegue(withIdentifier: "startVideo", sender: nil)
    }
}
