//
//  AddDesination.swift
//  Travel-log
//
//  Created by Kilz on 12/05/2020.
//  Copyright © 2020 Kilz. All rights reserved.
//

import SwiftUI

struct AddDesination: View {
    @State var username: String = ""
    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
      Form {
        Section(header: Text("Detination")) {
            TextField("Title", text: $username)
            TextField("Description", text: $username)
            TextField("Image URl", text: $username)
        }
        
        Section(header: Text("Reviews")) {
            TextField("Comments", text: $username)
            TextField("Rating", text: $username)
        }
        
               Section(header: Text("Location")) {
                   TextField("longitude", text: $username)
                   TextField("Latitude", text: $username)
               }
        }
                .navigationBarItems(trailing:
                    Button(action: {
                        print("Edit button pressed...")
                    }) {
                        Text("Save")
                        .padding(.all)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(Font.body.bold())
                        

                    }
                )
    }
        
        
           .navigationBarTitle("Add Destination")
            
        }
    }
}





struct AddDesination_Previews: PreviewProvider {
    static var previews: some View {
        AddDesination()
    }
}
