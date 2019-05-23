//
//  EyesightStatisticInteractorOutput.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol EyesightStatisticInteractorOutput: AnyObject {
    
    func updateEyesightCheckModelsArray(eyesightStatisticArray: [EyesightCheckNoteModel])
}
