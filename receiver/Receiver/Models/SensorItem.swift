//
//  SensorItem.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/10/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import CoreLocation

/*
 
 Abstract model, representig sensor's proximity and accuracy
 
 */

enum SensorProximity: Int {
    case unknown
    case immediate
    case near
    case far
}

class SensorItem {
    
    let proximity: SensorProximity
    let accuracy: Double
    var beacon: CLBeacon
    
    init(beacon: CLBeacon) {
        self.beacon = beacon
        self.accuracy = beacon.accuracy
        self.proximity = SensorProximity(rawValue: beacon.proximity.rawValue) ?? .unknown
    }
    
}

extension SensorItem: Equatable { }

func == (lhs: SensorItem, rhs: SensorItem) -> Bool {
    return lhs.beacon == rhs.beacon
}
