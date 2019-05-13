//
//  ExerciseDetailViewController.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit
import SDWebImage

class ExerciseDetailViewController: UIViewController, ExerciseDetailViewInput {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    var text: String = ""
    var path: String = ""
    var output: ExerciseDetailViewOutput!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = text
        imageView?.sd_setImage(with: URL(string: self.path), completed: nil)
    }
    
    func initItems(text: String, _ imagePath: String) {
        self.text = text
        self.path = imagePath
    }
    
    //MARK: - ExerciseDetailViewInput
    
    
}
