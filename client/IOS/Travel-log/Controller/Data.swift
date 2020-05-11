//
//  Data.swift
//  Travel-log
//
//  Created by Kilz on 10/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI
import Foundation

struct Movie: Decodable, Identifiable {
    public var id: String
    public var name: String
    public var released: String
   
        

 
    enum CodingKeys: String, CodingKey {
           case id = "id"
           case name = "title"
           case released = "year"
    
        
        }
}



public class Data: ObservableObject {
    @Published var movies = [Movie]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Movie].self, from: d)
                    DispatchQueue.main.async {
                        self.movies = decodedLists
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
            
        }.resume()
         
    }
}
