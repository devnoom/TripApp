//
//  TransportScreenView.swift
//  TripApp
//
//  Created by MacBook Air on 30.05.24.
//

import SwiftUI

struct TransportScreenView: View {
    var body: some View {
        VStack {
            // MARK: - Content
            Text("Hello, dato-beqa!")
            
            // MARK: - Navigation Link
            NavigationLink(destination: CityView()) {
                Text("Go back to City View")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Transport")
    }
}

