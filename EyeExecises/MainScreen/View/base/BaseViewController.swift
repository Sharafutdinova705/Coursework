//
//  ViewController.swift
//  EyeExercises
//
//  Created by Гузель on 07/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var menuConstraint: NSLayoutConstraint!
    var isMenuHidden = true
    var dataBaseManager = DataBaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(menuButtonPressed),
                                               name: NSNotification.Name("menuButtonPressed"),
                                               object: nil)
        
        swipeLeft()
        swipeRight()
    }
    
    func swipeLeft() {
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeftSelector))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func swipeRight() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRightSelector))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedLeftSelector() {
        
        isMenuHidden = false
        NotificationCenter.default.post(name: NSNotification.Name("menuButtonPressed"), object: nil)
    }
    
    @objc func swipedRightSelector() {
        
        isMenuHidden = true
        NotificationCenter.default.post(name: NSNotification.Name("menuButtonPressed"), object: nil)
    }
    
    @objc func menuButtonPressed() {
        
        if isMenuHidden {
            isMenuHidden = false
            menuConstraint.constant = 0
        } else {
            isMenuHidden = true
            menuConstraint.constant = -250
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func initData() {
        
        dataBaseManager.clearAll()
        if dataBaseManager.obtainCoins() == nil {
           
            let userModel = UserModel()
            userModel.id = 1
            userModel.coin = 10000000
            dataBaseManager.saveItem(item: userModel)
        }
    }
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) { }
}

