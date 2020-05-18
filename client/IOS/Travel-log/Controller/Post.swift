//
//  Post.swift
//  Travel-log
//
//  Created by Kilz on 13/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class Post: ObservableObject {
    
@Published var order = Order()
//@Published var orders = [Order]()
    
//init() {
//    getOrder()
//
//}
    
    func postItem(_ order: Order) {
        guard let encoded = try? JSONEncoder().encode(order) else {
                    print("Failed to encode order")
                    return
                }

                let url = URL(string: "http://localhost:1337/api/logs")!
                var request = URLRequest(url: url)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpMethod = "POST"
                request.httpBody = encoded

                URLSession.shared.dataTask(with: request) {
                    (data, response, error) in
                    guard let upData = data else {
                        print(error?.localizedDescription ?? "Unkown error")
                        return
                    }

                    if let decodeOrder = try? JSONDecoder().decode(Order.self, from: upData) {

                    print(decodeOrder)
//                      self.confirmationMessage = "Your Destination \(decodeOrder.title) has been sent to server"
//                      self.showingConfirmation = true
                  } else {
                        print(error?.localizedDescription)
                  }
                }
            .resume()
    }
    
    
    
    //get Request
//
//    func getOrder() {
//        let url = URL(string: "http://localhost:1337/api/logs")!
//
//            URLSession.shared.dataTask(with: url) { (data,response,error) in
//                do {
//                    if let entries = data {
//                        let decoDestination = try JSONDecoder().decode([Order].self, from: entries)
//
//                        DispatchQueue.main.async {
//                            self.orders = decoDestination
//                        }
//
//                    } else {
//                        print("No Info from API")
//                    }
//                } catch {
//
//                    print(error)
//                }
//            } .resume()
//    }

}
