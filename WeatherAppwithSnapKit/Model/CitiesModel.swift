//
//  CitiesModel.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 8.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation

// MARK: - CitiesModel
class CitiesModel: Codable {
    var coord: Coord?
    var country: Country?
    var id: Int?
    var name, state: String?
    var isAdded:Bool?
}

// MARK: - Coord
struct Coord: Codable {
    var lat, lon: Double?
}

enum Country: String, Codable {
    case tr = "TR"
}
