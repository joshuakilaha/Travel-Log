//
//  DestinationRow.swift
//  Travel-log
//
//  Created by Kilz on 10/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI

struct DestinationRow: View {
    
    @ObservedObject var order : Order
    
    var body: some View {
        HStack {
            Text(order.title)
            Spacer()
            Text(order.description)
        }
    }
}

struct DestinationRow_Previews: PreviewProvider {
    static var previews: some View {
        DestinationRow(order: Order())
    }
}
