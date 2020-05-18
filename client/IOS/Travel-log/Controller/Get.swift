//
//  Get.swift
//  Travel-log
//
//  Created by Kilz on 18/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import Foundation
class Get: ObservableObject {
 //   @Published var order = Order()
    @Published var orders = [LogEntries]()
        
    init() {
        getOrder()

    }
        //get Request
        
        func getOrder() {
            let url = URL(string: "http://localhost:1337/api/logs")!
                
                URLSession.shared.dataTask(with: url) { (data,response,error) in
                    do {
                        if let entries = data {
                            let decoDestination = try JSONDecoder().decode([LogEntries].self, from: entries)

                            DispatchQueue.main.async {
                                self.orders = decoDestination
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
