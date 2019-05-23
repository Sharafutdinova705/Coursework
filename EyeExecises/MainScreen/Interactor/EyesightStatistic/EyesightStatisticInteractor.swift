//
//  EyesightStatisticInteractor.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class EyesightStatisticInteractor: EyesightStatisticInteractorInput {
    
    var output: EyesightStatisticInteractorOutput!
    var dataBase: DataBaseManagerProtocol!
    
    func getAllEyesightCheckModels()  {
        
        var eyesightStatisticArray: [EyesightCheckNoteModel] = []
        
        eyesightStatisticArray = dataBase.obtainEyesightCheck()
        output.updateEyesightCheckModelsArray(eyesightStatisticArray: eyesightStatisticArray)
    }
}
