//
//  Coordinator.swift
//  AdsVizs
//
//  Created by Siya Yang on 2020-07-20.
//  Copyright © 2020 AdsVizs. All rights reserved.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
    
    var control : MapView
    
    init(_ control: MapView){
        self.control = control
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation,  didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
        
        
        //mean for changing the annotation ui, but dont work
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "TESTING NOTE")
        annotationView.canShowCallout = true
        annotationView.image = UIImage(systemName: "location.circle")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        let size = CGSize(width: 40, height: 40)
        annotationView.image = UIGraphicsImageRenderer(size:size).image {
            _ in annotationView.image!.draw(in:CGRect(origin:.zero, size:size))
            
        }
        
    }
}
