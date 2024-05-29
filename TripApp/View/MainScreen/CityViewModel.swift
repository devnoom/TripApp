//
//  CityViewModel.swift
//  TripApp
//
//  Created by MacBook Air on 29.05.24.
//

import Foundation

final class CityViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var cities: [City] = []
    @Published var errorMessage: String?
    @Published var showAlert = false
    @Published var currentTip = ""

    // MARK: - Travel Tips
    
    let travelTips = [
        "Pack light and bring only essentials.",
        "Learn basic phrases in the local language.",
        "Always carry a portable charger.",
        "Try local food and delicacies.",
        "Keep a copy of important documents.",
        "Be aware of your surroundings.",
        "Stay hydrated and rest well.",
        "Use public transportation when possible.",
        "Keep emergency contacts handy.",
        "Respect local customs and traditions."
    ]
    
    // MARK: - Methods
    
    func loadCities() {
        NetworkManager.shared.fetchCities { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cities):
                    self?.cities = cities
                case.failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func showRandomTip() {
        currentTip = travelTips.randomElement() ?? "Enjoy your trip!"
        showAlert = true
    }
}
