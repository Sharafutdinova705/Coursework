//
//  StatisticInteractor.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class StatisticInteractor: StatisticInteractorInput {
    
    var output: StatisticInteractorOutput!
    var dataBase: DataBaseManagerProtocol!
    
    func obtainAllStatistics() {
        
        let arrayOfEyesightCheck = dataBase.obtainEyesightCheck()
        var array: [Double] = []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        
        let secondDateFormatter = DateFormatter()
        secondDateFormatter.dateFormat = "YYYY"
        
        for item in arrayOfEyesightCheck {
            if Double(secondDateFormatter.string(from: item.date)) == Double(secondDateFormatter.string(from: Date())) {
                if let month = Double(dateFormatter.string(from: item.date)) {
                    array.append(month)
                }
            }
        }
        
        if array != [] {
            array = array.sorted()
            
            output.updateStatistics(statisticarray: searchCount(array: array))
        } else {
            output.updateStatistics(statisticarray: [0, 0])
        }
    }
    
    func searchCount(array: [Double]) -> [Double] {
        
        var secondArray: [Double] = []
        
        var count = 0
        
        for i in 1...Int(array.max()!) {
            
            count = 0
            
            for item in array {
            
                if Int(item) == i {
                    count+=1
                }
            }
            secondArray.insert(Double(count), at: i - 1)
        }
        return secondArray
    }
    
    func obtainUsageStatistic() {
        
        let arrayOfEyesightCheck = dataBase.obtainEyesightCheck()
        var array: [Double] = []
        
        if arrayOfEyesightCheck != [] && arrayOfEyesightCheck.count <= 7 {
            for index in stride(from: arrayOfEyesightCheck.count, to: 1, by: -1) {
                array.append(Double(arrayOfEyesightCheck[arrayOfEyesightCheck.count - index].rightEyesight + arrayOfEyesightCheck[arrayOfEyesightCheck.count - index].leftEyesight + arrayOfEyesightCheck[arrayOfEyesightCheck.count - index].bothEyesight) / 3)
            }
        }
        
        if array != [] {
            output.updateUsageStatistics(statisticarray: array)
        } else {
            output.updateUsageStatistics(statisticarray: [0, 0])
        }
    }
}
