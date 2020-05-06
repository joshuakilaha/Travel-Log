//
//  CircleImage.swift
//  Travel Log
//
//  Created by Kilz on 02/04/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI


struct CircleImage: View {
    var body: some View {
        Image("")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 20)
    }
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
