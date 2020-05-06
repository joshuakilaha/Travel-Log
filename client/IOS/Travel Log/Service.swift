//
//  Service.swift
//  Travel Log
//
//  Created by Kilz on 31/03/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation
class Service: NSObject {
    
    static let shared = Service()
    
    //GET Logs
    func getLogs(completion: @escaping (Result<[LogEntry], Error>) -> ()) {
        guard let url = URL(string: "http://localhost:1337/api/logs")
            else {
                return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                 if let err = err {
                               print("Failed to fetch Posts from the Url", err)
                               return
                           }
                           guard let data = data else {
                               return
                           }

                           do {

                               //print(String(data: data, encoding: .utf8) ?? "")
                               let entries = try JSONDecoder().decode([LogEntry].self, from: data)
                               completion(.success (entries))
                           }
                           catch {
                               completion(.failure(error))
                           }
                          //print(String(data: data, encoding: .utf8) ?? "")
            }
        }.resume()
    
    
    }
}
