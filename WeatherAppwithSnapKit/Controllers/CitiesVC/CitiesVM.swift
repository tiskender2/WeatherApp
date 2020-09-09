//
//  CitiesVM.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 8.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
struct Section {
    let letter : String
    let names : [CitiesModel]
}
protocol CitiesVMDelegates: class {
    func getCitiesData()
}

class CitiesVM {
    let callNetwork = Network.shared
    static let shared = CitiesVM()
    weak var delegates: CitiesVMDelegates?
    var citiesArray = [Character: [CitiesModel]]()
    var sections = [Section]()
}
extension CitiesVM {
    func getCities(){
        callNetwork.getCities { [weak self] (model) in
            guard let self = self else {return}
            self.getSortedArray(array: model)
            self.delegates?.getCitiesData()
        }
    }
    func getSortedArray(array:[CitiesModel]) {
        self.citiesArray = Dictionary(grouping: array, by: { $0.name!.first! })
        let keys = self.citiesArray.keys.sorted()
        self.sections = keys.map{ Section(letter: $0.uppercased(), names: self.citiesArray[$0]!.sorted(by: { (modell, model2) -> Bool in
            var isSorted = false
            if let first = modell.name, let second = model2.name {
                isSorted = first < second
            }
            return isSorted
        })) }
    }
}
