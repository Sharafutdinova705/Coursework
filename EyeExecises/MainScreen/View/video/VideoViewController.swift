//
//  VideoViewController.swift
//  EyeExecises
//
//  Created by Гузель on 03/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController, VideoViewInput {

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var labelsStackView: UIStackView!
    @IBOutlet weak var getMoney: UIButton!
    var presenter: VideoViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        circleView.layer.cornerRadius = circleView.frame.size.width / 2
        circleView.clipsToBounds = true
    }

    @IBAction func startExercise(_ sender: Any) {
        
        labelsStackView.isHidden = true
        
        presenter.doExercises(selfView: self.view, circleView: circleView)
    }
    
    func showEnd() {
        
        UIView.animate(withDuration: 1.5, animations: {
            
            self.circleView.center.x = self.view.center.x
            self.circleView.center.y = self.view.frame.maxY - self.circleView.frame.height - 16
        }) { (isFinished) in
            
            UIView.animate(withDuration: 1.5, animations: {
                
                self.getMoney.titleLabel?.text = "Get 50$"
                self.getMoney.isHidden = false
            })
        }
    }
    @IBAction func getMoneyAction(_ sender: Any) {
        
        getMoney.isHidden = true
        presenter.updateCountOfCoin(coin: 50)
        NotificationCenter.default.post(name: NSNotification.Name("moneyReceived"), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
