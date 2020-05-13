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
    init() {
        postDestination()
    }
    
    func postDestination() {
        
        let destination = [LogEntries]()
        
     
        
    }
}









//        let url = URL(string: "http://localhost:1337/api/logs")!
//        let destination = [LogEntries]()
//
//        let finalBody = try! JSONSerialization.data(withJSONObject: destination)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = finalBody
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//                    guard let data = data else { return }
//                    let resData = try! JSONDecoder().decode(LogEntries.self, from: data)
//                    print(resData.res)
//                    if resData.res == "correct" {
//                        DispatchQueue.main.async {
//                            self.authenticated = true
//                        }
//                    }
//                }.resume()









//class HttpAuth: ObservableObject {
//
//    @Published var authenticated = false
//
//    func postAuth(username: String, password: String) {
//        guard let url = URL(string: "http://mysite/loginswift.php") else { return }
//
//        let body: [String: String] = ["username": username, "password": password]
//
//        let finalBody = try! JSONSerialization.data(withJSONObject: body)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = finalBody
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data else { return }
//            let resData = try! JSONDecoder().decode(ServerMessage.self, from: data)
//            print(resData.res)
//            if resData.res == "correct" {
//                DispatchQueue.main.async {
//                    self.authenticated = true
//                }
//            }
//        }.resume()
//    }
//}
