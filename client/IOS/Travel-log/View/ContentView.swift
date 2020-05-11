//
//  ContentView.swift
//  Travel-log
//
//  Created by Kilz on 09/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI




//struct ContentView: View {
//   // @ObservedObject var destinations = Service()
//    @ObservedObject var fetcher = Data()
//
//    var body: some View {
//        VStack {
//            List(fetcher.movies) { movie in
//                VStack (alignment: .leading) {
//                    Text(movie.name)
//                    Text(movie.released)
//                        .font(.system(size: 11))
//                        .foregroundColor(Color.gray)
//                }
//            }
//        }
//
//
////        VStack {
////            List(destinations.logs) { log in
////                VStack (alignment: .leading) {
////                    Text(log.title)
////                    Text(log.comments)
////                    .font(.system(size: 11))
////                    .foregroundColor(Color.gray)
////                }
////
////            }
////        }
//
//
//
//    }
//}
//
//
////struct ContentView: View {
////
////    var body: some View {
////
////        VStack {
////            MapView()
////                .edgesIgnoringSafeArea(.top)
////                .frame(height: 300)
////
////            CircleImage()
////                .offset(y: -130)
////                .padding(.bottom, -130)
////            VStack(alignment: .leading) {
////                      Text("Mt.Kenya")
////                        .font(.title)
////                        .fontWeight(.bold)
////
////
////                      HStack {
////                          Text("Tallest Mountain in kenya")
////                              .font(.subheadline)
////                          Spacer()
////                          Text("Nyeri")
////                              .font(.subheadline)
////                      }
////
////                Text("Comments")
////                    .fontWeight(.bold)
////                    .padding(.top, 40)
////                  }
////
////              .padding()
////
////            Spacer()
////        }
////
////
////    }
////}


struct ContentView: View {
    @ObservedObject var fetch = Service()
    
    var body: some View {

        
        VStack {
            List(fetch.logs) { log in
                VStack (alignment: .leading) {
                    Text(log.title)
                }
            }
        }
        
        
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
