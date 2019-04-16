//
//  GradientView.swift
//  EyeExercises
//
//  Created by Гузель on 07/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
    
        didSet {
            updateView()
        }
    }

    override class var layerClass: AnyClass {
        
        get {
            return CAGradientLayer.self
        }
    }
    
    @IBInspectable var isDiagonal: Bool = true {
        
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
        
        if (self.isDiagonal) {
        
            layer.startPoint = CGPoint(x: 0, y: 1)
            layer.endPoint = CGPoint (x: 1, y: 0)
        } else {
            
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        }
    }
}
