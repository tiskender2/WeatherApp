//
//  DateExtension.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
extension Date {
    func dateFormatTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
    func get(_ type: Calendar.Component)-> String {
        let calendar = Calendar.current
        let t = calendar.component(type, from: self)
        return (t < 10 ? "0\(t)" : t.description)
    }
    func getTodayWeekDay()-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let weekDay = dateFormatter.string(from: self)
        return weekDay
    }
}
extension String {
    func dateFormatterString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from:self)!
        return date
    }
}
