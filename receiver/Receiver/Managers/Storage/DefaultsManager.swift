//
//  DefaultsManager.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/10/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class DefaultsManager {
    static let shared = DefaultsManager()
    private init() {}
    
    private let defaults = UserDefaults.standard
    
    // store date of the last unlock attempt
    var lastUnlockTryDate: Date? {
        get {
            return defaults.value(forKey: Constants.lastUnlockTryDateKey) as? Date
        }
        set {
            defaults.set(newValue, forKey: Constants.lastUnlockTryDateKey)
        }
    }
    
    func clean() {
        let appDomain = Bundle.main.bundleIdentifier!
        defaults.removePersistentDomain(forName: appDomain)
    }
}
