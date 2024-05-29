//
//  HotelsScreenView.swift
//  TripApp
//
//  Created by MacBook Air on 29.05.24.
//

import SwiftUI

struct HotelsScreenView: View {
    var body: some View {
        VStack {
            // MARK: - Content
            Text("Hello, beqa!")
            
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
        .navigationTitle("Hotels")
    }
}



