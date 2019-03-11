//
//  DataResponseExtension.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Alamofire

extension DataResponse {
    
    // error log helper
    func logError() {
        print("\nFailed request: \(request?.url?.absoluteString ?? "")")
        
        if let errorData = self.data, let errorMessage = String(data: errorData, encoding: .utf8) {
            print("Error : \(errorMessage)")
        }
    }
    
}
