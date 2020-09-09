//
//  TimeWeatherCVUICell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

extension TimeWeatherCVCell {
    func setupCell(){
        contentStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 4, view: contentView)
        contentStackView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(8)
            make.bottomMargin.greaterThanOrEqualTo(0)
        }
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 12
        backView.smoothShadow()
        backView.snp.makeConstraints { (make) in
            make.size.equalTo(55)
        }
        backView.addSubview(weatherImageView)
        weatherImageView.snp.makeConstraints { (make) in
            make.size.equalTo(30)
            make.center.equalToSuperview()
        }
        weatherImageView.contentMode = .scaleAspectFit
        timeLabel.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(20)
        }
        contentStackView.addArrangedSubview(views: [backView,setupLabel()])
        
    }
    func setupLabel() -> UILabel {
        timeLabel.font = .robotoMedium112
        timeLabel.textColor = .slate
        timeLabel.textAlignment = .center
        timeLabel.text = "02:30"
        return timeLabel
    }
}
