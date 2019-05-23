//
//  StatisticPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class StatisticPresenter: StatisticViewOutput, StatisticInteractorOutput {
    
    var interactor: StatisticInteractorInput!
    var view: StatisticViewInput!
    
    func obtainAllStatistics() {
        interactor.obtainAllStatistics()
    }
    
    func updateStatistics(statisticarray: [Double]) {
        view.updateStatistics(statisticarray: statisticarray)
    }
    
    func obtainUsageStatistic() {
        interactor.obtainUsageStatistic()
    }
    
    func updateUsageStatistics(statisticarray: [Double]) {
        view.updateUsageStatistics(statisticarray: statisticarray)
    }
}
