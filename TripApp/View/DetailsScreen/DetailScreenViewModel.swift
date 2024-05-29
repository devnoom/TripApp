//
//  DetailScreenViewModel.swift
//  TripApp
//
//  Created by MacBook Air on 29.05.24.
//

import Foundation

import Foundation

final class DetailScreenViewModel: ObservableObject {
    // MARK: - Properties
    @Published var city: City

    init(city: City) {
        self.city = city
    }
}

