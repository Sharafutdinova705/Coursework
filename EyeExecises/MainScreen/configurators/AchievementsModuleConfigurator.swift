//
//  AchievementsModuleConfigurator.swift
//  EyeExecises
//
//  Created by Гузель on 14/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class AchievementsModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let viewController = self.viewController as? AchievementsViewController else { return }
        let dataBase = DataBaseManager()
        let presenter = AchievementPresenter()
        let interactor = AchievementsInteractor()
        let router = AchievementsRouter()
        
        viewController.output = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
        interactor.dataBase = dataBase
        interactor.output = presenter
        router.output = presenter
        router.view = viewController
    }
}
