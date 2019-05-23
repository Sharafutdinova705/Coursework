//
//  EyesightCheckPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 09/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class EyesightCheckPresenter: EyesightCheckViewOutput, EyesightCheckInteractorOutput, EyesightCheckRouterOutput {
    
    var view: EyesightCheckViewInput!
    var router: EyesightCheckRouterInput!
    var interactor: EyesightCheckInteractorInput!
    
    //MARK: - MainScreenViewOutput
    
    func obtainCountOfCoin() {
        interactor.obtainCountOfCoin()
    }
    
    func updateCountOfCoin(coin: Int) {
        view.updateCountOfCoin(coin: coin)
    }
    func showNewDataAlert() {
        router.showNewDataAlert()
    }
    
    func showStatistics() {
        router.showStatistics()
    }
    
    func saveEyesightCheck(eyesightCheck: EyesightCheckNoteModel) {
        interactor.saveEyesightCheck(eyesightCheck: eyesightCheck)
    }
}
