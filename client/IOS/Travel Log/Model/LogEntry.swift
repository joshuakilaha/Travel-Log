//
//  LogEntry.swift
//  Travel Log
//
//  Created by Kilz on 31/03/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation
import UIKit


class LogEntry: Decodable {
    
   

    let _id: String
    let title: String
    let comments: String
    let rating: Int
    let description: String
    let image: String
    let latitude: Double
    let longitude: Double
    let visitDate: String

    
}

