//
//  API.swift
//  mvvm test
//
//  Created by ODC on 7/16/18.
//  Copyright © 2018 Orange Developer Center. All rights reserved.
//

import Foundation
import Alamofire

class API {

    static let sharedInstance = API()
    
    // MARK: - Private Properties
    fileprivate let manager: SessionManager
    
    // MARK: - Designated Initializer
    init() {
        self.manager = Configuration.manager
    }
    
    func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest {
            return manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
    
    
    static func getBaseUrl() -> String {
        guard let info = Bundle.main.infoDictionary,
            let urlString = info["Base Url"] as? String else {
                fatalError("Cannot get base url from info.plist")
        }
        
        return urlString
    }
    
}


struct Configuration {
    static var manager: SessionManager {
        let configuration = URLSessionConfiguration.default
        
        return Alamofire.SessionManager(configuration: configuration)
    }
}
