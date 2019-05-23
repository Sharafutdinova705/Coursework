//
//  VideoModuleConfigurator.swift
//  EyeExecises
//
//  Created by Гузель on 03/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class VideoModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let viewController = self.viewController as? VideoViewController else { return }
        let presenter = VideoPresenter()
        let interactor = VideoInteractor()
        let dataBase = DataBaseManager()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataBase = dataBase
        presenter.view = viewController
    }
}
