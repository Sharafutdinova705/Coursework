//
//  ExercisesViewController.swift
//  EyeExecises
//
//  Created by Гузель on 10/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat", "Cow", "Camel", "Sheep", "Goat", "Cow", "Camel", "Sheep", "Goat", "Cow", "Camel", "Sheep", "Goat"]
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 34
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.tableView.register(EyesightStatisticTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.animals.count
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
        
        // note that indexPath.section is used rather than indexPath.row
        cell.titleLabel.text = self.animals[indexPath.section]
        cell.descriptionLabel.text = "asdfgh asdfgasdfgsdfasdfgh asdfgasdfgsdfasd fghasdfgasdfgsdfa  sdfghasdfga sdfgsdf asdfghasdfgasdfgsdfasdfghasdfgasdfgsdfasdfghasdfgasdf gsdfasdfghasdfgasdfgsdfasdfgh asdfgasdfgsdfasdfghasdfgasdfgsdfasdfghas"
        
        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
