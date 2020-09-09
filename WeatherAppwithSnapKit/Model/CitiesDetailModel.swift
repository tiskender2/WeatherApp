//
//  CitiesDetailModel.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation

// MARK: - CitiesDetail

struct CitiesDetailModel: Codable {
    var cod: String?
    var message, cnt: Int?
    var list: [List]?
    var city: City?
}

// MARK: - City
struct City: Codable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var timezone, sunrise, sunset: Int?
}


// MARK: - List
struct List: Codable {
    var dt: Int?
    var main: MainClass?
    var weather: [Weather]?
    var clouds: Clouds?
    var wind: Wind?
    var visibility: Int?
    var pop: Double?
    var sys: Sys?
    var dtTxt: String?
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    var all: Int?
}

// MARK: - MainClass
struct MainClass: Codable {
    var temp, feelsLike, tempMin, tempMax: Double?
    var pressure, seaLevel, grndLevel, humidity: Int?
    var tempKf: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Sys
struct Sys: Codable {
    var pod: Pod?
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Codable {
    var id: Int?
    var main: String?
    var weatherDescription: String?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
}

enum Description: String, Codable {
    case azBulutlu = "az bulutlu"
    case açık = "açık"
    case kapalı = "kapalı"
    case parçalıAzBulutlu = "parçalı az bulutlu"
    case parçalıBulutlu = "parçalı bulutlu"
}

// MARK: - Wind
struct Wind: Codable {
    var speed: Double?
    var deg: Int?
}
