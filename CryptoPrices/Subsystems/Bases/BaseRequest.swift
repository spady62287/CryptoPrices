//
//  BaseRequest.swift
//  CryptoPrices
//
//  Created by Daniel Spady on 2021-03-22.
//

import Foundation

class BaseRequest {
    
    var url: URL? {
        return nil
    }
    
    var request: URLRequest? {
        if let url = url {
            let request = URLRequest(url: url)
            
            return request
        }
        return nil
    }
    
    var getRequest: URLRequest? {
        if var request = request {
            request.httpMethod = "GET"
            return request
        }
        return nil
    }
}
