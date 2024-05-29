//
//  NetworkManager.swift
//  TripApp
//
//  Created by MacBook Air on 29.05.24.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Fetch Cities
    
    func fetchCities(completion: @escaping (Result<[City], Error>) -> Void) {
        guard let url = URL(string: "https://mocki.io/v1/e2025f47-4cf5-4eb5-972c-a78c01ed1a6d") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let cities = try JSONDecoder().decode([City].self, from: data)
                completion(.success(cities))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
