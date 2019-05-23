//
//  SettingsModuleConfigurator.swift
//  EyeExecises
//
//  Created by Гузель on 14/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class SettingsModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let viewController = self.viewController as? SettingsViewController else { return }
        let dataBase = DataBaseManager()
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor()
        let router = SettingsRouter()
        
        viewController.output = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.dataBase = dataBase
        interactor.output = presenter
        router.view = viewController
    }
}
