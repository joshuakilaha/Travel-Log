//
//  Order.swift
//  Travel-log
//
//  Created by Kilz on 13/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation


class Order: ObservableObject, Codable, Identifiable {
    
    enum CodingKeys: CodingKey {
        
        case  title, comments, rating, description, image, latitude, longitude, visitDate
    }
    
  //  @Published var id = ""
    @Published var title = ""
    @Published var comments = ""
    @Published  var rating = 2
    @Published  var description = ""
    @Published  var image = ""
    @Published  var latitude = 0.0
    @Published  var longitude = 0.0
    @Published  var visitDate = Date()
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
      //  id = try container.decode(String.self, forKey: ._id)
        
        title = try container.decode(String.self, forKey: .title)
        comments = try container.decode(String.self, forKey: .comments)
        rating = try container.decode(Int.self, forKey: .rating)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(String.self, forKey: .image)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        visitDate = try container.decode(Date.self, forKey: .visitDate)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
    //    try container.encode(id, forKey: ._id)
        try container.encode(title, forKey: .title)
        try container.encode(comments, forKey: .comments)
        try container.encode(rating, forKey: .rating)
        try container.encode(description, forKey: .description)
        try container.encode(image, forKey: .image)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(visitDate, forKey: .visitDate)
    }
    
}


//    var valiedDetails: Bool {
//        if  title.isEmpty || comments.isEmpty || rating.isEmpty || description.isEmpty || image.isEmpty || latitude.isEmpty || longitude.isEmpty || visitDate.isEmpty {
//            return false
//        }
//        return true
//    }
    
