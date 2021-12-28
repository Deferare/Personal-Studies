//
//  MapView.swift
//  Chapter_11
//
//  Created by Deforeturn on 12/27/21.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable{
    let coordinate: CLLocationCoordinate2D
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let camera = MKMapCamera(
            lookingAtCenter: coordinate, fromDistance: 2500, pitch: 45, heading: 0
        )
        uiView.setCamera(camera, animated: true)
    }
}


