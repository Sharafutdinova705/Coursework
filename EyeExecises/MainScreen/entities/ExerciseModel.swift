//
//  ExerciseModel.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

@objcMembers
class ExerciseModel: Object {
    
    dynamic var id = 0
    dynamic var name = String()
    dynamic var information = String()
    dynamic var url = String()
    
    override static func primaryKey() -> String? {
        return #keyPath(id)
    }
}
