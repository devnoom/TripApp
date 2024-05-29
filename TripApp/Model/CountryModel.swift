//
//  CountryModel.swift
//  TripApp
//
//  Created by MacBook Air on 29.05.24.
//

import Foundation

struct City: Identifiable, Codable, Hashable {
    var id: Int
    var name: String
    var description: String
    var population: Int
    var region: String
    var country: String
    var nationality: String
    var mainImage: String
    var detailImages: [String]
}


