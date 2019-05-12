//
//  FoundedItem.swift
//  TestsProject
//
//  Created by Гузель on 12/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

struct FoundedItem {
    
    var titleLabel: String
    var imagepath: String
    
    init(titleLabel: String, path: String) {
        self.titleLabel = titleLabel
        self.imagepath = path
    }
}

extension FoundedItem: JSONDecodable {
    
    /// Инициализация с помощью json
    ///
    /// - Parameter JSON: json в виде словаря
    init?(JSON: [String:AnyObject]) {
        self.titleLabel = JSON["text"] as! String
        self.imagepath = ""
        if let attachments = JSON["attachments"] as? [[String:AnyObject]] {
            if let photo = attachments.first!["photo"] as? [String:AnyObject] {
                if let photo1024 = photo["photo_1280"] as? String {
                    self.imagepath = photo1024
                }
            }
        }
    }
}
