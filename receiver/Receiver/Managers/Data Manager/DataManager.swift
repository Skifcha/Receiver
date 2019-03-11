//
//  DataManager.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    private init() {}
    
    @discardableResult func unlock(id: Int, completion: @escaping UnlockCompletion) -> DataRequestObject {
        return ApiManager.shared.unlock(id: id, completion: completion)
    }
    
}
