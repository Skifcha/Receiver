//
//  UnlockSensorHandler.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/10/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import UIKit

class UnlockSensorHandler {
    
    static let shared = UnlockSensorHandler()
    private init() {}
    
    // init with last time unlocked, stored in UserDefaults
    private var lastUnlockTryDate: Date? = DefaultsManager.shared.lastUnlockTryDate {
        didSet {
            DefaultsManager.shared.lastUnlockTryDate = lastUnlockTryDate
        }
    }
    // store request, so it won't duplicate itself every 4 seconds just in case
    private var unlockDataRequest: DataRequestObject?
    
    func tryToUnlock(sensorItem: SensorItem) {
        // check if proximity suits our needs
        if (sensorItem.proximity != .near && sensorItem.proximity != .immediate) || sensorItem.accuracy > 0.3 {
            return
        }
        
        // make only one request per 4 sec
        if let lastUnlockTryDate = lastUnlockTryDate {
            if Date().timeIntervalSince(lastUnlockTryDate) < 4 {
                return
            }
        }
        
        lastUnlockTryDate = Date()
        
        // don't start new request if there is already one live
        if let unlockDataRequest = unlockDataRequest, !unlockDataRequest.isFinished {
            return
        }
        
        DataManager.shared.unlock(id: Constants.predefinedLockId /* Should be sensor related id */) { (error) in
            self.unlockDataRequest = nil
            
            if let error = error {
                // request was force cancelled, just ignore it
                if error.code == NSURLErrorCancelled {
                    return
                }
                
                UIViewController.topViewController?.showAlert(message: "Unlocking error: \(error.localizedDescription)")
                return
            }
            
            NotificationCenter.default.post(name: .successfulUnlockNotificationName, object: Constants.predefinedLockId)
        }
    }
    
}
