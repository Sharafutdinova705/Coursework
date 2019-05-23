//
//  EyesightStatisticPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class EyesightStatisticPresenter: EyesightStatisticViewOutput, EyesightStatisticInteractorOutput {
    
    var interactor: EyesightStatisticInteractorInput!
    var view: EyesightStatisticViewInput!
    
    func getAllEyesightCheckModels() {
        interactor.getAllEyesightCheckModels()
    }
    
    func updateEyesightCheckModelsArray(eyesightStatisticArray: [EyesightCheckNoteModel]) {
        view.updateEyesightCheckModelsArray(eyesightStatisticArray: eyesightStatisticArray)
    }
}
