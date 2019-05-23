//
//  StatisticViewController.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit
import Charts

class StatisticViewController: UIViewController , StatisticViewInput{
    
    @IBOutlet weak var eyesightStatisticCellView: UIView!
    @IBOutlet weak var eyesightStatisticLinaChartView: LineChartView!
    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var statisticCellView: UIView!
    var dataSet: LineChartDataSet!
    var presenter: StatisticViewOutput!
    
    var entries: [ChartDataEntry]!
    
    var eyesightCheckNoteModelArray: [Double] = []
    var usageStatisticArray: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.obtainAllStatistics()
        presenter.obtainUsageStatistic()
        
        statisticCellView.layer.cornerRadius = 30
        statisticCellView.clipsToBounds = true
        
        updateChartDataForFirstStatistic()
        updateChartDataForSecondStatistic()
    }
    
    func updateStatistics(statisticarray: [Double]) {
        self.eyesightCheckNoteModelArray = statisticarray
    }
    
    func updateUsageStatistics(statisticarray: [Double]) {
        self.usageStatisticArray = statisticarray
    }
    
    func updateChartDataForFirstStatistic() {
        
        entries = Array()
        
        for (i, value) in eyesightCheckNoteModelArray.enumerated()
        {
            entries.append(ChartDataEntry(x: Double(i), y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
        }
        
        dataSet = LineChartDataSet(values: entries, label: "First unit test data")
        dataSet.drawIconsEnabled = false
        dataSet.iconsOffset = CGPoint(x: 0, y: 20.0)
        
        lineChart.leftAxis.axisMinimum = 0.0
        lineChart.rightAxis.axisMinimum = 0.0
        lineChart.data = LineChartData(dataSet: dataSet)
        dataSet = nil
        entries = nil
    }
    
    func updateChartDataForSecondStatistic() {
        
        entries = Array()
        
        for (i, value) in usageStatisticArray.enumerated()
        {
            entries.append(ChartDataEntry(x: Double(i), y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
        }
        
        dataSet = LineChartDataSet(values: entries, label: "First unit test data")
        dataSet.drawIconsEnabled = false
        dataSet.iconsOffset = CGPoint(x: 0, y: 20.0)
        
        eyesightStatisticLinaChartView.leftAxis.axisMinimum = 0.0
        eyesightStatisticLinaChartView.rightAxis.axisMinimum = 0.0
        eyesightStatisticLinaChartView.data = LineChartData(dataSet: dataSet)
        dataSet = nil
        entries = nil
    }
}
