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
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showEyesightCheckPage),
                                               name: NSNotification.Name("showEyesightCheckPage"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showExercises),
                                               name: NSNotification.Name("showExercises"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showStatisticPage),
                                               name: NSNotification.Name("showStatisticPage"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showAchievements),
                                               name: NSNotification.Name("showAchievements"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showSettings),
                                               name: NSNotification.Name("showSettings"),
                                               object: nil)
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuButtonPressed"), object: nil)
    }
    
    @IBAction func startExercisesAsVideo(_ sender: Any) {
        performSegue(withIdentifier: "startVideo", sender: nil)
    }
    
    @objc func showExercises() {
        performSegue(withIdentifier: "showExercises", sender: nil)
    }
    
    @objc func showEyesightCheckPage() {
        performSegue(withIdentifier: "showEyesightCheckPage", sender: nil)
    }
    
    @objc func showStatisticPage() {
        performSegue(withIdentifier: "showStatisticPage", sender: nil)
    }
    
    @objc func showAchievements() {
        performSegue(withIdentifier: "showAchievements", sender: nil)
    }
    
    @objc func showSettings() {
        performSegue(withIdentifier: "showSettings", sender: nil)
    }
}
