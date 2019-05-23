//
//  MainScreenPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 16/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class MainScreenPresenter: MainScreenViewOutput, MainScreenInteractorOutput {
    
    var view: MainScreenViewInput!
    var interactor: MainScreenInteractorInput!
    
    //MARK: - MainScreenViewOutput
    
    func obtainCountOfCoin() {
        interactor.obtainCountOfCoin()
    }
    
    func updateCountOfCoin(coin: Int) {
        view.updateCountOfCoin(coin: coin)
    }
}
