//
//  VideoPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 03/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class VideoPresenter: VideoViewOutput, VideoInteractorOutput {

    var interactor: VideoInteractorInput!
    var view: VideoViewInput!

    func doExercises(selfView: UIView, circleView: UIView) {
        interactor.doExercises(selfView: selfView, circleView: circleView)
    }

    func showEnd() {
        view.showEnd()
    }
    
    func updateCountOfCoin(coin: Int) {
        interactor.updateCountOfCoin(coin: coin)
    }
}
