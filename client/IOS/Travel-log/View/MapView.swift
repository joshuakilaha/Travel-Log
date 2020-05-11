//
//  MapView.swift
//  Travel-log
//
//  Created by Kilz on 10/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: -0.149864, longitude: 37.308494)
    
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 1.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    
    
        func makeUIView(context: Context) -> MKMapView {
            MKMapView(frame: .zero)
        }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
