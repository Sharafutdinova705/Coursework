//
//  APIManager.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

/// Enum с одним кейсом состоящим из базового url и пути
///
/// - Current: кейсом состоящим из базового url и пути
enum RequestType: FinalURLPoint {
    
    case current()
    
    var baseURL: URL {
        return URL(string: "https://api.vk.com/method/wall.get?")!
    }
    
    var path: String {
        
        switch self {
            
        case .current():
            return "owner_id=-182232110&filter=all&v=5.92&access_token=d65e5a0cf74021802937d7edfd8cbada7bdbb9d5dec471cebcf00893b8d038c42aa38c8cc74edef3ea9d1"
        }
    }
    
    var request: URLRequest {
        
        let url = URL(string: baseURL.absoluteString + path)
        return URLRequest(url: url!)
    }
}

class APIManager: APIManagerProtocol {
    
    /// конфигурация сессии
    let sessionConfiguration: URLSessionConfiguration
    /// Сессия строящаяся по конфигурации
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    } ()
    
    /// инициализация конфигурации
    ///
    /// - Parameter sessionConfiguration: принимает конфигурацию
    init(sessionConfiguration: URLSessionConfiguration) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    /// Получение результата
    ///
    /// - Parameters:
    ///   - term: то, что ищем
    ///   - settings: Settings, по которым ищем
    ///   - completionHandler: completionHandler
    func fetchResultWith(completionHandler: @escaping (APIResult<FoundedItem>) -> Void) {
        
        let request = RequestType.current().request
        
        fetch(request: request, parse: { (json) -> [FoundedItem]? in
            
            if let dictionary = json["response"]!["items"] as? [[String: AnyObject]] {
                var founded: [FoundedItem] = []
                
                for item in dictionary {
                    founded.append(FoundedItem(JSON: (item))!)
                }
                return founded
            } else {
                return nil
            }
        }, completionHandler: completionHandler)
    }
}
