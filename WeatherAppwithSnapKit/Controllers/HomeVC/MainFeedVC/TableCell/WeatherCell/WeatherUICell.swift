//
//  WeatherUICell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
extension WeatherCell {
    func setupCell() {
        contentView.addSubview(backView)
        backView.backgroundColor = .white
        contentView.backgroundColor = .paleGrey
        backView.layer.cornerRadius = 12
        backView.smoothShadow()
        backView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(35)
            make.bottom.equalToSuperview().inset(32)
            make.size.height.equalTo(166)
        }
        superStackView.setupStackView(alignment: .fill, distribution: .fillProportionally, axis: .horizontal, spacing: 30 , view: backView)
        
        superStackView.snp.makeConstraints { (make) in
            make.bottom.top.equalToSuperview().inset(35)
            make.leading.trailing.equalToSuperview().inset(25)
        }
        superStackView.addArrangedSubview(views: [weatherImageView,setupDetailView(),setupDegreeView()])
        
        weatherImageView.snp.makeConstraints { (make) in
            make.width.equalTo(90)
        }
        weatherImageView.image = UIImage(named: "sun4")
    }
    fileprivate func setupDetailView() -> UIView {
        let detailView = UIView()
        detailStackView.setupStackView(alignment:.fill, distribution: .fill, axis: .vertical, spacing: 20, view: detailView)
        detailStackView.isBaselineRelativeArrangement = true
        detailStackView.addArrangedSubview(views: [weatherDegreeLabel,weatherNameLabel,dateLabel])
        weatherDegreeLabel.text = "35C"
        weatherDegreeLabel.font = .robotoRegular40
        weatherDegreeLabel.textColor = .purplyBlue
        
        weatherNameLabel.text = "Güneşli"
        weatherNameLabel.font = .robotoMedium14
        weatherNameLabel.textColor = .slate
        
        dateLabel.text = "7/20/20"
        dateLabel.font = .robotoMedium112
        dateLabel.textColor = .purplyBlue
        
        detailStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return detailView
    }
    fileprivate func setupDegreeView() -> UIView {
        let degreeView = UIView()
       // degreeView.backgroundColor = .red
        let contentView = UIView()
       // contentView.backgroundColor = .red
        let contentStackView = UIStackView()
        let upStackView = UIStackView()
        let downStackView = UIStackView()
        
       
        
        upStackView.setupStackView(alignment: .center, distribution: .fill, axis: .horizontal, spacing: 8, view: degreeStackView)
        upStackView.addArrangedSubview(views: [upImageView,upDegreeLabel])
        upDegreeLabel.text = "38"
        upDegreeLabel.font = .robotoRegular16
        upDegreeLabel.textColor = .slate
        
       /* upImageView.snp.makeConstraints { (make) in
            make.size.equalTo(15)
        }*/
        upImageView.image = UIImage(named: "upArrow")
        upStackView.contentMode = .center
        
        downStackView.setupStackView(alignment: .center, distribution: .fill, axis: .horizontal, spacing: 8, view: degreeStackView)
        downStackView.addArrangedSubview(views: [downImageView,downDegreeLabel])
        /*downImageView.snp.makeConstraints { (make) in
            make.size.equalTo(15)
        }*/
        downImageView.image = UIImage(named: "downArrow")
        downImageView.contentMode = .center
        
        downDegreeLabel.text = "35"
        downDegreeLabel.font = .robotoRegular16
        downDegreeLabel.textColor = .slate
      
        
        contentStackView.setupStackView(alignment: .center, distribution: .fillEqually, axis: .vertical, spacing: 0, view: contentView)
        contentStackView.addArrangedSubview(views: [upStackView,downStackView])
        
        contentStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        degreeStackView.setupStackView(alignment:.fill, distribution: .fill, axis: .horizontal, spacing: 10, view: degreeView)
        degreeStackView.addArrangedSubview(views: [seperatorView,contentView])
        
        seperatorView.snp.makeConstraints { (make) in
            make.width.equalTo(2)
        }
        seperatorView.backgroundColor = .paleGrey
       
        degreeView.snp.makeConstraints { (make) in
            make.width.equalTo(70)
        }
        degreeStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return degreeView
    }
}
