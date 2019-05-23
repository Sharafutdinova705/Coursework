//
//  AchievementsViewController.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController, AchievementsViewInput, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var countOfCoin: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    var output: AchievementsViewOutput!
    var achievements: [AchievementModel] = []
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        output.getAllAchievements()
        output.obtainCountOfCoin()
    }
    
    func updateCountOfCoin(coin: Int) {
        countOfCoin.title = String(coin) + "$"
     }
    
    func updateAchievements(achievements: [AchievementModel]) {
        
        self.achievements = achievements
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AchievementCell", for: indexPath) 
        
        cell.textLabel?.text = achievements[indexPath.row].name
        cell.detailTextLabel?.text = achievements[indexPath.row].information
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.check(index: indexPath.row)
    }
}
