//
//  AddDesination.swift
//  Travel-log
//
//  Created by Kilz on 12/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI

struct AddDesination: View {
    @ObservedObject var order : Order
    
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                
      Form {
        Section(header: Text("Detination")) {
            TextField("Title", text: $order.title )
            TextField("Description", text: $order.description)
            TextField("Image URl", text: $order.image)
        }
        
        Section(header: Text("Reviews")) {
            TextField("Comments", text: $order.comments)
            TextField("Rating", text: $order.rating)
        }
        
               Section(header: Text("Location")) {
                TextField("longitude", text: $order.longitude)
                TextField("Latitude", text: $order.latitude)
               }
        }
                .navigationBarItems(trailing:
                    Button(action: {
                        print("Save Button Pressed")
                        
                    }) {
                        NavigationLink(destination: ContentView(order: order)) {
                        Text("Save")
                        .padding(.all)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(Font.body.bold())
                        }
//                        .disabled(order.valiedDetails == false)
                    }
                )
            }
           .navigationBarTitle("Add Destination")
        }
    }
}


struct AddDesination_Previews: PreviewProvider {
    static var previews: some View {
        AddDesination(order: Order())
    }
}
