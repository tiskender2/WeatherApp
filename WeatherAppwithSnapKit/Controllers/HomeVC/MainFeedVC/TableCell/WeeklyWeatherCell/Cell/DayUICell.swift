//
//  DayUICell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension DayCell {
    func setupCell(){
        contentStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .horizontal, spacing: 4, view: contentView)
        contentStackView.snp.makeConstraints { (make) in
            make.bottom.top.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(8)
        }
        contentStackView.addArrangedSubview(views: [setupDayLabel(),setupDetailSV()])
       
    }
    fileprivate func setupDayLabel() -> UIView {
        let view = UIView()
        view.addSubview(dayLabel)
        dayLabel.font = .robotoMedium112
        dayLabel.textColor = .slate
        dayLabel.text = "Pazartesi"
        dayLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setupDetailSV() -> UIView {
        let view = UIView()
        detailStackView.setupStackView(alignment: .fill, distribution: .fillEqually, axis: .horizontal, spacing: 16, view: view)
        detailStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(120)
        }
        detailStackView.addArrangedSubview(views: [setupIconIV(),setupDayDegreeLabel(),setupNightDegreeLabel()])
        return view
    }
    fileprivate func setupIconIV() -> UIView {
        let view = UIView()
        view.addSubview(iconImageView)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setupDayDegreeLabel() -> UIView {
        let view = UIView()
        view.addSubview(dayDegreeLabel)
        dayDegreeLabel.font = .robotoMedium14
        dayDegreeLabel.textColor = .slate
        dayDegreeLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
    fileprivate func setupNightDegreeLabel() -> UIView {
        let view = UIView()
        view.addSubview(nightDegreeLabel)
        nightDegreeLabel.font = .robotoRegular15
        nightDegreeLabel.textColor = .blueGrey
        nightDegreeLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return view
    }
}
