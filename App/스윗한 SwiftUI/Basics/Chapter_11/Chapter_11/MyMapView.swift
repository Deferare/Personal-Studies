//
//  MyMapView.swift
//  Chapter_11
//
//  Created by Deforeturn on 12/27/21.
//

import SwiftUI
import MapKit
struct MyMapView: View {
    @State private var coordinate = CLLocationCoordinate2DMake(37.551416, 126.988194)
    let locations = [
        "남산":CLLocationCoordinate2DMake(37.551416, 126.988194)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
            MapView(coordinate: coordinate)
            HStack(spacing: 30){
                ForEach(["남산"], id:\.self){ location in
                    Button(action: {self.coordinate = self.locations[location]!}){
                        Text(location)
                    }
                }
            }
        }
    }
}

struct MyMapView_Previews: PreviewProvider {
    static var previews: some View {
        MyMapView()
    }
}
