//
//  CircleImage.swift
//  Travel-log
//
//  Created by Kilz on 10/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("mount")
        .clipShape(Circle())
                   .overlay(
                       Circle().stroke(Color.gray, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
