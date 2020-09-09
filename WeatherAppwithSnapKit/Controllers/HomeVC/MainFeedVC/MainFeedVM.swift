//
//  MainFeedVM.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
protocol MainFeedVMDelegates: class {
    func getDetailData()
}
class MainFeedVM {
    let callNetwork = Network.shared
    static let shared = MainFeedVM()
    weak var delegate: MainFeedVMDelegates?
    var day: Int?
    var sum = 0.0
    var cityID:Int? {
        didSet {
            DataManager.timeWeatherArray.removeAll()
            getDetail()
        }
    }
}
extension MainFeedVM {
    func getDetail(){
        callNetwork.getDetail(id: cityID ?? 0) { [weak self] (model) in
            guard let self = self else {return}
            DataManager.detailArray = model
            model.list?.forEach({ (date) in
                let isoDate = date.dtTxt
                let isEqual = self.checkDate(date: isoDate ?? "")
                if isEqual {
                    DataManager.timeWeatherArray.append(date)
                }
                
            })
            self.delegate?.getDetailData()
        }
    }
    func checkDate(date:String) -> Bool {
       
        let date = date.dateFormatterString()

        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .weekday], from: date)
        let myDate = calendar.dateComponents([.year, .month, .day, .hour, .weekday], from: Date())
       
        if components.day == myDate.day {
            return true
        }
        return false
    }
  
    
}
