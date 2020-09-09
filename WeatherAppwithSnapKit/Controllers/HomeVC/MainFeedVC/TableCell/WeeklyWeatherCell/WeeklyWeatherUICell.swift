//
//  WeeklyWeatherUICell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension WeeklyWeatherCell {
    func setupCell(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(DayCell.self, forCellReuseIdentifier: "DayCell")
        contentView.addSubview(tableView)
        contentView.backgroundColor = .paleGrey
        tableView.layer.cornerRadius = 12
        //tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
      
        contentStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 14, view: contentView)
        
        contentStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(16)
        }
        contentStackView.addArrangedSubview(views: [setupTitleLabel(),setupView()])
    }
    fileprivate func setupTitleLabel() -> UILabel {
        titleLabel.font = .robotoMedium16
        titleLabel.textColor = .slate
        titleLabel.text = "Haftalık Hava Durumu"
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
        }
        return titleLabel
    }
    fileprivate func setupView() -> UIView {
        detailView.layer.cornerRadius = 12
        detailView.smoothShadow()
        detailView.addSubview(tableView)
        detailView.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(7*70)
        }
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return detailView
    }
    
}
extension WeeklyWeatherCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayCell
        cell.dayLabel.text = "Cumartesi"
        cell.iconImageView.image = UIImage(named: "Snow")
        cell.dayDegreeLabel.text = "10"
        cell.nightDegreeLabel.text = "2"
        return cell
    }
   /* override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        tableView.layoutIfNeeded()
        tableView.frame = CGRect(x: 0, y: 0, width: targetSize.width , height: 50)
        return tableView.contentSize
    }*/
}
extension WeeklyWeatherCell : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
