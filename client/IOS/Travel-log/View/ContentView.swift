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
    
   // @ObservedObject var order = Order()
    
  //  @State var getOrders = Get()
    var body: some View {
        
//
//        NavigationView {
//            VStack {
//                List(getOrders.orders) { ordery in
//                    VStack (alignment: .leading) {
//                        Text(ordery.title)
//                            .onAppear{
//                            print("here")
//                        }
//                    }
//                }
//            }
//            .navigationBarTitle("Destinations")
//           .navigationBarItems(trailing:
//            Button(action: {
//                print("Add Destination button pressed...")
//            }) {
//                NavigationLink(destination: AddDesination(order: Order())) {
//               Image(systemName: "plus")
//                }
//            }
//          )
//    }
//              NavigationView {
//    List(landmarkData) { landmark in
//        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//             LandmarkRow(landmark: landmark)
//        }
//    }
//.navigationBarTitle(Text("Landmarks"))
//}

            

        NavigationView {
            
            List(fetch.logs) { log in
                NavigationLink(destination: Destinations()) {
                    
                    VStack (alignment: .leading) {
                    Text(log.id)
                    Text(log.title)
                    Text(log.description)
                    Text(log.comments)
                    Text(log.image)
                }
                
            }
            
            
//            VStack {
//                List(fetch.logs) { log in
//                    VStack (alignment: .leading) {
//                        Text(log.id)
//                        Text(log.title)
//                        Text(log.description)
//                        Text(log.comments)
//                        Text(log.image)
//                    }
//                }
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
