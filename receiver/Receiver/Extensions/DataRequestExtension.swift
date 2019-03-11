//
//  DataRequestExtension.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/10/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Alamofire

/*
 
 Abastract protocol for network requests
 
 */

protocol DataRequestObject {
    func cancel()
    var isFinished: Bool { get }
    var isCancelled: Bool { get }
    var isPaused: Bool { get }
}

extension DataRequest: DataRequestObject {
    
    var isFinished: Bool {
        return progress.isFinished
    }
    
    var isCancelled: Bool {
        return progress.isCancelled
    }
    
    var isPaused: Bool {
        return progress.isPaused
    }
    
}
