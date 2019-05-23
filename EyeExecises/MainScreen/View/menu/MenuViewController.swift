//
//  MenuViewController.swift
//  EyeExercises
//
//  Created by Гузель on 08/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var presenter: MenuViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showExercises(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuButtonPressed"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("showExercises"), object: nil)
    }
    
    @IBAction func showEyesightCheckPage(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuButtonPressed"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("showEyesightCheckPage"), object: nil)
    }
    
    @IBAction func showStatisticPage(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuButtonPressed"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("showStatisticPage"), object: nil)
    }
    
    @IBAction func showAchievements(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuButtonPressed"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("showAchievements"), object: nil)
    }
    
    @IBAction func showSettings(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("menuButtonPressed"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("showSettings"), object: nil)
    }
}
