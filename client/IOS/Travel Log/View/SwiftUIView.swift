//
//  SwiftUIView.swift
//  Travel Log
//
//  Created by Kilz on 02/04/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI

//struct SwiftUIView: View {
//
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Turtle Rock")
//                .font(.title)
//            HStack {
//                Text("Joshua Tree National Park")
//                    .font(.subheadline)
//                Spacer()
//                Text("California")
//                    .font(.subheadline)
//            }
//        }
//    }
//}


struct SwiftUIView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
