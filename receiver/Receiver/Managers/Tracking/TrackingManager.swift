//
//  TrackingManager.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

/*
 
 Made it look similar to LocationManager in a way of multiple instances existence at once with their own delegates
 
 */

protocol TrackingManagerDelegate: class {
    
    func didUpdateLocation(for sensorItem: SensorItem)
    
}

class TrackingManager: NSObject {
    
    override init() {
        super.init()
        
        // configure default iBeacon region
        beaconRegion = createDeviceBeaconRegion()
        
        // request "always" usage for background updates
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
    }
    
    private lazy var locationManager = CLLocationManager()
    private var beaconRegion: CLBeaconRegion!
    weak var delegate: TrackingManagerDelegate?
    
    func startMonitoring() {
        startMonitoringAndRangingRegion(region: beaconRegion)
    }
    
    func stopMonitoring() {
        stopMonitoringAndRangingRegion(region: beaconRegion)
    }
    
    func createDeviceBeaconRegion() -> CLBeaconRegion {
        let region = CLBeaconRegion(proximityUUID: UUID(uuidString: Constants.proximityUUID)!,
                                    major: CLBeaconMajorValue(Constants.major),
                                    minor: CLBeaconMinorValue(Constants.minor),
                                    identifier: Constants.beaconID)
        region.notifyEntryStateOnDisplay = true
        return region
    }
    
    func startMonitoringAndRangingRegion(region: CLBeaconRegion) {
        locationManager.startMonitoring(for: region)
        locationManager.startRangingBeacons(in: region)
    }
    
    func stopMonitoringAndRangingRegion(region: CLBeaconRegion) {
        locationManager.stopMonitoring(for: region)
        locationManager.stopRangingBeacons(in: region)
    }
    
}

import UserNotifications

extension TrackingManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) && CLLocationManager.isRangingAvailable() {
                // check if device supports iBeacon ranging
                startMonitoring()
            } else {
                UIViewController.topViewController?.showAlert(message: "Your device does not support iBeacon monitoring.")
            }
        }
        
        if status == .authorizedWhenInUse {
            UIViewController.topViewController?.showAlert(message: "Please, allow background location usage as well.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        guard let region = region as? CLBeaconRegion else {
            return
        }
        
        // start ranging beacons if user enters monitored region
        locationManager.startRangingBeacons(in: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        guard let region = region as? CLBeaconRegion else {
            return
        }
        
        // start ranging beacons if user leaves monitored region
        locationManager.stopRangingBeacons(in: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        beacons.forEach { [weak self] (beacon) in
            // perform unlock attempt
            UnlockSensorHandler.shared.tryToUnlock(sensorItem: SensorItem(beacon: beacon))
            
            // optional delegate to notify some UI stuff
            self?.delegate?.didUpdateLocation(for: SensorItem(beacon: beacon))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        // gotchas
        print("Failed monitoring region: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // gotchas
        print("Location manager failed: \(error.localizedDescription)")
    }
    
}
