//
//  LocationManager.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-07-20.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject{
    
    private let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        self.location = location
    }
    
}

