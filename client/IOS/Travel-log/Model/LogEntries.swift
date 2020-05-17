//
//  LogEntries.swift
//  Travel-log
//
//  Created by Kilz on 09/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation


struct LogEntries: Codable, Identifiable {

    public var id: String
    public  var title: String
    public  var comments: String
    public  var rating: Int
    public  var description: String
    public  var image: String
    public  var latitude: Double
    public  var longitude: Double
    public  var visitDate: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case rating = "rating"
        case description = "description"
        case image = "image"
        case latitude = "latitude"
        case longitude = "longitude"
        case visitDate = "visitDate"
        case comments = "comments"
        case id = "_id"

        }

}
