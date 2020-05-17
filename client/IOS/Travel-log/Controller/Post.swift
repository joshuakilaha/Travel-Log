////
////  Post.swift
////  Travel-log
////
////  Created by Kilz on 13/05/2020.
////  Copyright © 2020 Kilz. All rights reserved.
////
//
//import Foundation
//import SwiftUI
//import Combine
//
//
//class Post {
//
//   @ObservedObject var order : Order
//
//    init() {
//        placeOder()
//    }
//
//    func placeOder() {
//                 guard let encoded = try? JSONEncoder().encode(order) else {
//                     print("Failed to encode order")
//                     return
//                 }
//
//                 let url = URL(string: "http://localhost:1337/api/logs")!
//                 var request = URLRequest(url: url)
//                 request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//                 request.httpMethod = "POST"
//                 request.httpBody = encoded
//
//                 URLSession.shared.dataTask(with: request) {
//                     (data, response, error) in
//                     guard let data = data else {
//                         print(error?.localizedDescription ?? "Unkown error")
//                         return
//                     }
//                   if let decodeOrder = try? JSONDecoder().decode(Order.self, from: data) {
//
//                    print("Destination \(decodeOrder.title)")
////                       self.confirmationMessage = "Your Destination \(decodeOrder.title) has been sent to server"
////                       self.showingConfirmation = true
//                   } else {
//                       print("Show error: ",error?.localizedDescription as Any)
//                   }
//                 }
//             .resume()
//             }
//
//}
