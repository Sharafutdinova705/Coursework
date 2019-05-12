//
//  StatisticViewController.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit
import Charts

class StatisticViewController: UIViewController {
    
    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var statisticCellView: UIView!
    var dataSet: LineChartDataSet!
    
    var entries: [ChartDataEntry] = Array()
    let values: [Double] = [8, 104, 81, 93, 52, 44, 97, 101, 75, 28,
                         //   76, 25, 20, 13, 52, 44, 57, 23, 45, 91,
                            99, 14, 84, 48, 40, 71, 106, 41, 45, 61]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        statisticCellView.layer.cornerRadius = 30
        statisticCellView.clipsToBounds = true
        
        for (i, value) in values.enumerated()
        {
            entries.append(ChartDataEntry(x: Double(i), y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
        }
        
        updateChartData()
    }
    
    func updateChartData() {
        
        dataSet = LineChartDataSet(values: entries, label: "First unit test data")
        dataSet.drawIconsEnabled = false
        dataSet.iconsOffset = CGPoint(x: 0, y: 20.0)
        
        lineChart.leftAxis.axisMinimum = 0.0
        lineChart.rightAxis.axisMinimum = 0.0
        lineChart.data = LineChartData(dataSet: dataSet)
    }
}
