//
//  MainScreenModuleConfigurator.swift
//  EyeExecises
//
//  Created by Гузель on 16/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class MainScreenModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let viewController = self.viewController as? MainScreenViewController else { return }
        let presenter = MainScreenPresenter()
        let dataBase = DataBaseManager()
        let interactor = MainScreenInteractor()
        
        viewController.output = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.output = presenter
        interactor.dataBase = dataBase
    }
}
