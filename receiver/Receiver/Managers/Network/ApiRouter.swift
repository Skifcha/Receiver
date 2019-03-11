//
//  ApiRouter.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Alamofire

import Foundation

enum ApiRouter: URLRequestConvertible {
    
    // unlock method
    case unlock(id: Int)
    
    private var baseURL: String {
        return Constants.baseServerAddress
    }
    
    private var method: Alamofire.HTTPMethod {
        switch self {
        case  .unlock:
            return .post
        }
    }
    
    private var path: String {
        switch self {
        case .unlock(let id):
            return Constants.unlockEndpoint(id)
        }
    }
    
    private var urlEncoder: ParameterEncoding {
        return Alamofire.URLEncoding()
    }
    
    private var jsonEncoder: ParameterEncoding {
        return Alamofire.JSONEncoding()
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = try URLRequest(url: URL(string: baseURL + path)!, method: method)
        
        // add auth header to every request
        request.setValue(Constants.apiAuthHeader, forHTTPHeaderField: "Authorization")
        
        return request
    }
}
