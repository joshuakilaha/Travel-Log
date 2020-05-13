////////
////////  Service.swift
////////  Travel-log
////////
////////  Created by Kilz on 09/05/2020.
////////  Copyright © 2020 Kilz. All rights reserved.
////////
//////
////
import Foundation


class Service: ObservableObject {
    @Published var logs = [LogEntries]()

    init() {
        getLogs()
    
    }

    func getLogs() {
        let url = URL(string: "http://localhost:1337/api/logs")!
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            do {
                if let entries = data {
                    let decoDestination = try JSONDecoder().decode([LogEntries].self, from: entries)

                    DispatchQueue.main.async {
                        self.logs = decoDestination
                    }
                    
                } else {
                    print("No Info from API")
                }
            } catch {
                
                print(error)
            }
        } .resume()
    }
}







