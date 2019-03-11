//
//  Constants.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

internal final class Constants {
    
//MARK:- Test lock id
    
    static var predefinedLockId = 5873
    
//MARK:- Api constants
    
    static var apiAuthHeader = "KISI-LINK 75388d1d1ff0dff6b7b04a7d5162cc6c"
    
    // could be computable, based on target preferences
    static var baseServerAddress: String = {
        return "https://api.getkisi.com"
    }()
    
    class func unlockEndpoint(_ id: Int) -> String {
        return "/locks/\(id)/access"
    }
    
//MARK:- Default broadcast region constants
    
    static var proximityUUID = "39ED98FF-2900-441A-802F-9C398FC199D2"
    static var major = 100
    static var minor = 1
    static var beaconID = "com.broadcaster.Broadcaster"
    
//MARK:- Store last date we've tried to unlock
    
    static var lastUnlockTryDateKey = "LastUnlockTryDateKey"
    
}
