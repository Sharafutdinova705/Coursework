//
//  AchievementModel.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

@objcMembers
class AchievementModel: Object {
    
    dynamic var id = 0
    dynamic var name = String()
    dynamic var information = String()
    dynamic var isTaken = Bool()
    dynamic var price = Int()
    
    override static func primaryKey() -> String? {
        return #keyPath(id)
    }
}
