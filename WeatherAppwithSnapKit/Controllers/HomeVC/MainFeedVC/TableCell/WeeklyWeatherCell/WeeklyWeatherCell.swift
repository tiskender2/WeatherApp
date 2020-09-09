//
//  WeeklyWeatherCell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class WeeklyWeatherCell: UITableViewCell {
    let contentStackView = UIStackView()
    let titleLabel = UILabel()
    let detailView = UIView()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
