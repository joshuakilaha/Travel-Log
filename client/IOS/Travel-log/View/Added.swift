//
//  Added.swift
//  Travel-log
//
//  Created by Kilz on 14/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI

struct Added: View {
    @ObservedObject var order : Order
    var body: some View {
        NavigationView {
            List{
                Form {
                    Section {
                        NavigationLink(destination: Added(order: order)) {
                            Text("To Add")
                        }
                    }
                }
            }
        }
    }
}

struct Added_Previews: PreviewProvider {
    static var previews: some View {
        Added(order: Order())
    }
}
