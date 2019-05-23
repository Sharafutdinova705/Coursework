//
//  EyesightStatisticViewController.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class EyesightStatisticViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EyesightStatisticViewInput {

    @IBOutlet weak var tableView: UITableView!
    var eyesightStatisticArray: [EyesightCheckNoteModel] = []
    var presenter: EyesightStatisticViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.tableView.register(EyesightStatisticTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        presenter.getAllEyesightCheckModels()
    }
    
    func updateEyesightCheckModelsArray(eyesightStatisticArray: [EyesightCheckNoteModel]) {
        self.eyesightStatisticArray = eyesightStatisticArray
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eyesightStatisticArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EyesightStatisticTableViewCell
        
        if indexPath.row == 0 {
            return cell
        }
        
        let eyesightStatisticModel = eyesightStatisticArray[indexPath.row - 1]
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        cell.numberOfRowLabel.text = String(indexPath.row)
        cell.dateOfNoteLabel.text = formatter.string(from: eyesightStatisticModel.date)
        cell.rightEyesightLabel.text = String(eyesightStatisticModel.rightEyesight)
        cell.leftEyesightLabel.text = String(eyesightStatisticModel.leftEyesight)
        cell.bothEyesightLabel.text = String(eyesightStatisticModel.bothEyesight)
        
        return cell
    }
}
