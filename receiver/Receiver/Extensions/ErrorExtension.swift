//
//  ErrorExtension.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/10/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

/*
 
 Get suitable error params as NSError properties
 
 */

extension Error {
    
    var code: Int {
        return (self as NSError).code
    }
    
    var domain: String {
        return (self as NSError).domain
    }
    
}
