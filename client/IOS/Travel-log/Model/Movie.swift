//
//  Movie.swift
//  Travel-log
//
//  Created by Kilz on 12/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation

struct Movie: Decodable, Identifiable {
    public var id: Int
    public var name: String
    public var released: String
    
    enum CodingKeys: String, CodingKey {
           case id = "id"
           case name = "title"
           case released = "year"
        }
}
