//
//  MapView.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-07-20.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    
    @Binding var latitude : Double
    @Binding var longitude : Double
    // kav, specific location
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let map = MKMapView()
        let sourceCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude:longitude)
        let region = MKCoordinateRegion(center: sourceCoordinate, latitudinalMeters: 50, longitudinalMeters: 50)
        map.region = region

        let pin = MKPointAnnotation()
        pin.coordinate = sourceCoordinate
        pin.title = "Pick up here"
        map.addAnnotation(pin)
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView> ){

    }

}
