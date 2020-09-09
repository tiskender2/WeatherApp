//
//  DataManager.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
struct Days {
    var day : Double
    let name : String
}
class DataManager {
    static var selectedCities:[CitiesModel] = []
    static var detailArray:CitiesDetailModel?
    static var timeWeatherArray:[List] = []
    static var weekDayArray:[Days] = []
    static var lastSelectedCity:IndexPath = [0,0]
    static var lastSelectetDailyWeather:IndexPath = [0,0]
   
}
