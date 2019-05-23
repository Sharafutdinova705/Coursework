//
//  EyesightCheckViewController.swift
//  EyeExecises
//
//  Created by Гузель on 09/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class EyesightCheckViewController: UIViewController, EyesightCheckViewInput {
    
    @IBOutlet weak var countOfCoin: UIBarButtonItem!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var output: EyesightCheckViewOutput!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.obtainCountOfCoin()
    }
    
    func updateCountOfCoin(coin: Int) {
        countOfCoin.title = String(coin) + "$"
    }
    
    @IBAction func writeData(_ sender: Any) {
        output.showNewDataAlert()
    }
    
    
    @IBAction func viewStatistic(_ sender: Any) {
        output.showStatistics()
    }
}
