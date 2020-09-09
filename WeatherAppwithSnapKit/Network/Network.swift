//
//  Network.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 8.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import Foundation
class Network {
    static let shared = Network()
    let apiKey = "bfbc5a83368b83d9af3a739264606829"
    var baseUrl: String {
        return "https://api.openweathermap.org/data/2.5/forecast?appid=\(apiKey)&lang=tr&"
    }
    let citiesURL = "https://weathercase-99549.firebaseio.com/.json"
    let searchUrl = "s="
    var search :String?
    
    
    
    func getDetail(id:Int,completionHandler: @escaping (CitiesDetailModel) -> Void) {
        
        let url = URL(string: baseUrl + "id=\(id)")!
        print(url)
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    return
            }
            if let data = data,
                let movies = try? JSONDecoder().decode(CitiesDetailModel.self, from: data) {
                completionHandler(movies)
            }
        })
        task.resume()
    }
    func getCities(completionHandler: @escaping ([CitiesModel]) -> Void) {
        
        let url = URL(string: citiesURL)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    return
            }
            if let data = data,
                let movies = try? JSONDecoder().decode([CitiesModel].self, from: data) {
                completionHandler(movies)
            }
        })
        task.resume()
    }
}
