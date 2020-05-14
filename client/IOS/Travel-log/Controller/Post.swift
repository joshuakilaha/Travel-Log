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
    @Published var logs = [LogEntries]()
    
    init() {
        postDestination()
    }
    
    func postDestination() {
        
            guard let encoded = try? JSONEncoder().encode(logs) else {
                print("Failed to encode destination")
                return
            }
            
            let url = URL(string: "http://localhost:1337/api/logs")!
            var request = URLRequest(url: url)
            request.setValue("application/josn", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = encoded
            
            URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                guard let data = data else {
                    print(error?.localizedDescription ?? "Unkown error")
                    return
                }
                if let decodeOrder = try? JSONDecoder().decode(LogEntries.self, from: data) {
                
                print("Sent to server, \(decodeOrder.title)")
//                  self.confirmationMessage = "Your Destination \(decodeOrder.title) has been sent to server"
//                  self.showingConfirmation = true
              } else {
                  print(error?.localizedDescription as Any)
              }
            }
        .resume()

    }
    
}
