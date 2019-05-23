//
//  EyesightCheckModuleConfigurator.swift
//  EyeExecises
//
//  Created by Гузель on 09/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class EyesightCheckModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let viewController = self.viewController as? EyesightCheckViewController else { return }
        let presenter = EyesightCheckPresenter()
        let router = EyesightCheckRouter()
        let interactor = EyesightCheckInteractor()
        let dataBase = DataBaseManager()
        
        viewController.output = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        router.output = presenter
        interactor.dataBase = dataBase
        interactor.output = presenter
    }
}
