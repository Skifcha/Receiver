//
//  ApiManager.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Alamofire

typealias UnlockCompletion = (Error?) -> Void

class ApiManager {
    
    static let shared = ApiManager()
    private init() {}
    
    func baseRequest(_ request: URLRequestConvertible) -> DataRequest {
        return Alamofire.request(request).validate(statusCode: 200..<300).responseJSON { (response) in
            if response.error != nil {
                response.logError()
            }
        }
    }
    
    func unlock(id: Int, completion: @escaping UnlockCompletion) -> DataRequestObject {
        return baseRequest(ApiRouter.unlock(id: id))
            .responseJSON { (response) in
                completion(response.result.error)
        }
    }
    
}
