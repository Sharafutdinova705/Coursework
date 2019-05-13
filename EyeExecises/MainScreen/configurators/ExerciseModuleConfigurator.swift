//
//  ExerciseModuleConfigurator.swift
//  EyeExecises
//
//  Created by Гузель on 12/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class ExerciseModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let viewController = self.viewController as? ExercisesViewController else { return }
        let dataBase = DataBaseManager()
        let presenter = ExercisesPresenter()
        let interactor = ExercisesInteractor()
        let router = ExercisesRouter()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
        interactor.dataBase = dataBase
        interactor.output = presenter
        interactor.view = viewController
        router.output = presenter
        router.view = viewController
    }
}
