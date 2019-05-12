//
//  UserModel.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

@objcMembers
class UserModel: Object {
    
    dynamic var id = 0
    dynamic var coin = Int()
    
    override static func primaryKey() -> String? {
        return #keyPath(id)
    }
}
