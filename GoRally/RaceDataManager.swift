//
//  RaceDataManager.swift
//  GoRally
//
//  Created by Don Wolfton on 9.09.23.
//

import UIKit
import CoreLocation

class RaceDataManager : CLLocation {

    var currentCoordinate: CLLocationCoordinate2D?

    var previousCoordinate: CLLocationCoordinate2D?

    var speedInMeters: CLLocationSpeed?

    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.startUpdatingLocation()
        return manager
    }()

    func countSpeed() {
        
    }

}

extension RaceDataManager: CLLocationManagerDelegate {
    func getLocation(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = manager.location?.coordinate {
            currentCoordinate = CLLocationCoordinate2D()
            currentCoordinate?.latitude = coordinate.latitude
            currentCoordinate?.longitude = coordinate.longitude
        }
    }
}

extension CLLocation {

    class func distance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> CLLocationDistance {
        let from = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let to = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return from.distance(from: to)
    }
}



