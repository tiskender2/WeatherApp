//
//  WeatherCell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class WeatherCell: UITableViewCell {
    var backView = UIView()
    var superStackView = UIStackView()
    var detailStackView = UIStackView()
    var degreeStackView = UIStackView()
    var weatherImageView = UIImageView()
    var upImageView = UIImageView()
    var downImageView = UIImageView()
    var weatherDegreeLabel = UILabel()
    var upDegreeLabel = UILabel()
    var downDegreeLabel = UILabel()
    var weatherNameLabel = UILabel()
    var dateLabel = UILabel()
    var seperatorView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCell(list:List?){
        weatherDegreeLabel.text = list?.main?.temp?.kelvinToCelcius()
        upDegreeLabel.text = list?.main?.tempMax?.kelvinToCelcius()
        downDegreeLabel.text = list?.main?.tempMin?.kelvinToCelcius()
        weatherNameLabel.text = list?.weather?.first?.weatherDescription
        let unixTimestamp = list?.dt ?? 0
        let newTime = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
        dateLabel.text = newTime.dateFormatTime()
        weatherImageView.image = UIImage(named: list?.weather?.first?.main ?? "sun3")
    }
}
