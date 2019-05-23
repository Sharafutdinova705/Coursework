//
//  StatisticViewInput.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol StatisticViewInput: AnyObject {
    
    func updateStatistics(statisticarray: [Double])
    
    func updateUsageStatistics(statisticarray: [Double])
}
