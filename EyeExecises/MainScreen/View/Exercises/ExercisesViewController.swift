//
//  ExercisesViewController.swift
//  EyeExecises
//
//  Created by Гузель on 10/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit
import RealmSwift

class ExercisesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExercisesViewInput {
    
    @IBOutlet weak var countOfCoin: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var exercises: [ExerciseModel] = []
    var dataBase = DataBaseManager()
    var apimanager = APIManager(sessionConfiguration: URLSessionConfiguration.default)
    var presenter: ExercisesViewOutput!
    var currentCountOfCoin = 0
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 34
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        getAllExercises()
    }
    
    func initCountOfCoin(count: Int) {
        currentCountOfCoin = count
        countOfCoin.title = String(count) + "$"
    }
    
    func getAllExercises() {
        
        presenter.getCountOfCoin()
        
        exercises = dataBase.obtainExercises()
        
        if exercises == [] {
            
            apimanager.fetchResultWith() { (result) in
                
                switch result {
                    
                case .success(let foundedItem):
                    
                    for _ in foundedItem {
                    
                        let exerciseModel = ExerciseModel()
                        exerciseModel.id = self.getLastId() + 1
                        exerciseModel.name = "Buy for 500$"
                        exerciseModel.information = ""
                        exerciseModel.url = ""
                        self.exercises.append(exerciseModel)
                        self.dataBase.saveItem(item: exerciseModel)
                    }
                    
                    self.tableView.reloadData()
                
                case .failure(let error):
                
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getLastId() -> Int {

        var allId: [Int] = []
        let exercisesArray = dataBase.obtainExercises()
        let eyesightCheckArray = dataBase.obtainEyesightCheck()
        let achievementArray = dataBase.obtainAchievements()
        let usageArray = dataBase.obtainUsageDate()
        let userModel = dataBase.obtainCoins()
        
        allId.append(userModel?.id ?? 1)
        
        for item in exercisesArray {
            allId.append(item.id)
        }
        
        for item in eyesightCheckArray {
            allId.append(item.id)
        }
        
        for item in achievementArray {
            allId.append(item.id)
        }
        
        for item in usageArray {
            allId.append(item.id)
        }
        
        return allId.max() ?? 0
    }
    
    func updateExercisesArray(array: [ExerciseModel]) {
        exercises = array
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.exercises.count
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ExercisesTableViewCell
        
        if exercises[indexPath.section].information == "" {
            cell.hiddenExerciseView.isHidden = false
            cell.descriptionLabel.isHidden = true
            cell.priceOfExerciseLabel.text = exercises[indexPath.section].name
        } else {
            cell.hiddenExerciseView.isHidden = true
            cell.descriptionLabel.isHidden = false
            cell.descriptionLabel.text = exercises[indexPath.section].information
        }
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ExercisesTableViewCell
        if cell.hiddenExerciseView.isHidden {
            performSegue(withIdentifier: "toExerciseDetailVC", sender: indexPath.section)
        } else {
            
            presenter.showBuyingAlert(cell: cell, index: indexPath.section, currentCountOfCoin: self.currentCountOfCoin)
        }
    }
    
    func buyExercise(index: Int) {
        
        presenter.buyExercise(index: index, array: self.exercises)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toExerciseDetailVC" {
            let secondVC = segue.destination as! ExerciseDetailViewController
            if let index = sender as? Int {
                secondVC.initItems(text: self.exercises[index].information, self.exercises[index].url)
            }
        }
    }
}
