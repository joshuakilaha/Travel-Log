//
//  ContentView.swift
//  Travel-log
//
//  Created by Kilz on 09/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetch = Service()
    @State var selection: Int? = nil
    
    @ObservedObject var order = Order()
    var body: some View {

        NavigationView {
            VStack {
                List(fetch.logs) { log in
                    VStack (alignment: .leading) {
                        Text(log.id)
                        Text(log.title)
                        Text(log.description)
                        Text(log.comments)
                        Text(log.image)
                        
                    }
                }
            }
            .navigationBarTitle("Destinations")
            .navigationBarItems(trailing:
                Button(action: {
                    print("Add Destination button pressed...")
                    
                    
                }) {
                    NavigationLink(destination: AddDesination(order: Order())) {
                   Image(systemName: "plus")
                    }
                }
                
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
