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

    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false

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

            Stepper(value: $order.rating, in: 2...10, label: {
                       Text("Rating:   \(order.rating)")

            })
        }


               Section(header: Text("Location")) {

                DatePicker(selection: $order.visitDate, in: ...Date(), displayedComponents: .date) {
                    Text("Select a date")
                    
                }
                 
                TextField("Longitude", value: $order.longitude, formatter: NumberFormatter())

                TextField("Latitude", value: $order.latitude, formatter: NumberFormatter())
                
               }
        }

                Button("Post") {
                    self.placeOder()
                } .alert(isPresented: $showingConfirmation) {
                Alert(title: Text("Thank you!"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
                    }
          }
           .navigationBarTitle("Add Destination")
        }
    }
    
    

    func placeOder() {
              guard let encoded = try? JSONEncoder().encode(order) else {
                  print("Failed to encode order")
                  return
              }

              let url = URL(string: "http://localhost:1337/api/logs")!
              var request = URLRequest(url: url)
              request.setValue("application/json", forHTTPHeaderField: "Content-Type")
              request.httpMethod = "POST"
              request.httpBody = encoded

              URLSession.shared.dataTask(with: request) {
                  (data, response, error) in
                  guard let data = data else {
                      print(error?.localizedDescription ?? "Unkown error")
                      return
                  }
                if let decodeOrder = try? JSONDecoder().decode(Order.self, from: data) {
                    self.confirmationMessage = "Your Destination \(decodeOrder.title) has been sent to server"
                    self.showingConfirmation = true
                } else {
                    print("Show error: ",error?.localizedDescription as Any)
                }
              }
          .resume()
          }
}


struct AddDesination_Previews: PreviewProvider {
    static var previews: some View {
        AddDesination(order: Order())
    }
}

