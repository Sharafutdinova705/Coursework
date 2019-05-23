//
//  EyesightStatisticConfigurator.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class EyesightStatisticConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let viewController = self.viewController as? EyesightStatisticViewController else { return }
        let presenter = EyesightStatisticPresenter()
        let interactor = EyesightStatisticInteractor()
        let dataBase = DataBaseManager()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        interactor.output = presenter
        interactor.dataBase = dataBase
    }
}
