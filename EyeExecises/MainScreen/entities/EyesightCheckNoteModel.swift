//
//  EyesightCheckNoteModel.swift
//  EyeExecises
//
//  Created by Гузель on 11/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

@objcMembers
class EyesightCheckNoteModel: Object {
    
    dynamic var id = 0
    dynamic var date = Date()
    dynamic var rightEyesight = Int()
    dynamic var leftEyesight = Int()
    dynamic var bothEyesight = Int()
    
    override static func primaryKey() -> String? {
        return #keyPath(id)
    }
}
