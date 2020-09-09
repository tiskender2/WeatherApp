//
//  DailyDetailUICell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

extension DailyDetailCell {
    func setupCell(){
        contentStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .horizontal, spacing: 12, view: contentView)
        contentStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        contentStackView.addArrangedSubview(views: [setupWeatherImageView(),setupDetailSV()])
    }
    fileprivate func setupWeatherImageView() -> UIView {
        let view = UIView()
        view.addSubview(weatherImageView)
        weatherImageView.contentMode = .center
        weatherImageView.image = UIImage(named: "sun4")
        weatherImageView.snp.makeConstraints { (make) in
            make.size.equalTo(20)
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setupDetailSV() -> UIView {
        let view = UIView()
        detailStackView.setupStackView(alignment: .fill, distribution: .fillEqually, axis: .vertical, spacing: 4, view: view)
        detailStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        detailStackView.addArrangedSubview(views: [setupTitleLabel(),setupSubTitleLabel()])
        return view
    }
    fileprivate func setupTitleLabel() -> UIView {
        let view = UIView()
        view.addSubview(titleLabel)
        titleLabel.font = .robotoMedium112
        titleLabel.textColor = .slate
        titleLabel.text = "Rüzgar"
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setupSubTitleLabel() -> UIView {
        let view = UIView()
        view.addSubview(subTitleLabel)
        subTitleLabel.font = .robotoLight12
        subTitleLabel.textColor = .slate
        subTitleLabel.text = "12mhs/s"
        subTitleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
}
