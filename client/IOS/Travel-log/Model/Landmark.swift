//
//  Landmark.swift
//  Travel-log
//
//  Created by Kilz on 10/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
       
    }
}
