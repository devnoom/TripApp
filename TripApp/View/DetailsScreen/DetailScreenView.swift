//
//  DetailScreenView.swift
//  TripApp
//
//  Created by MacBook Air on 29.05.24.
//

import SwiftUI

struct DetailScreenView: View {
    // MARK: - Properties Instance
    @ObservedObject var viewModel: DetailScreenViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                // MARK: - City Description
                Text("🏙️: \(viewModel.city.description)")
                    .font(.headline)

                // MARK: - Main Image
                AsyncImage(url: URL(string: viewModel.city.mainImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                // MARK: - Detail Images
                ForEach(viewModel.city.detailImages, id: \.self) { detailImage in
                    AsyncImage(url: URL(string: detailImage)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 400, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.city.name)

        // MARK: - Navigation Links
        VStack {
            HStack(spacing: 30) {
                NavigationLink(destination: HotelsScreenView()) {
                    Text("Hotels")
                }
                NavigationLink(destination: TransportScreenView()) {
                    Text("Transport")
                }
                NavigationLink(destination: MustSeeScreenView()) {
                    Text("Must See")
                }
            }
            .padding()
            .background(Color.cyan)
            .foregroundColor(.white)
            .cornerRadius(5)
        }
        .navigationBarTitle("Navigation Link Button")
    }
}
