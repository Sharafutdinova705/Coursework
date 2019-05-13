//
//  MenuScreenModuleConfigurator.swift
//  EyeExecises
//
//  Created by Гузель on 16/04/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class MenuScreenModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let viewController = self.viewController as? MenuViewController else { return }
        let presenter = MenuPresenter()
        let router = MenuRouter()
        
        viewController.presenter = presenter
        presenter.router = router
        router.view = viewController
    }
}
