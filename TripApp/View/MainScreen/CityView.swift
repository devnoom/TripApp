//
//  CityView.swift
//  TripApp
//
//  Created by MacBook Air on 29.05.24.
//

import SwiftUI

struct CityView: View {
    // MARK: - Properties
    @StateObject private var viewModel = CityViewModel()
    @State private var selectedCity: City?

    // MARK: - Life Cycle
    var body: some View {
        NavigationStack {
            List(viewModel.cities) { city in
                VStack(alignment: .leading) {
                    NavigationLink(value: city) {
                        EmptyView()
                            .frame(width: 0, height: 0)
                    }
                    
                    Text(city.name)
                        .font(.headline)
                        .onTapGesture {
                            selectedCity = city
                        }
                    
                    AsyncImage(url: URL(string: city.mainImage)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                }
                .padding(.vertical, 10)
            }
            .navigationTitle("Cities")
            .onAppear {
                viewModel.loadCities()
            }
            .navigationDestination(for: City.self) { city in
                DetailScreenView(viewModel: DetailScreenViewModel(city: city))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.showRandomTip()
                    }) {
                        Text("Travel Tips")
                    }
                }
            }
            // MARK: - Alert
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Travel Tip"), message: Text(viewModel.currentTip), dismissButton: .default(Text("ბოდიში აჩი")))
            }
        }
    }
}
