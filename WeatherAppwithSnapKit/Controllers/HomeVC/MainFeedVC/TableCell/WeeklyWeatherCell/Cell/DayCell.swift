//
//  DayCell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class DayCell: UITableViewCell {
    let contentStackView = UIStackView()
    let detailStackView = UIStackView()
    let dayLabel = UILabel()
    let iconImageView = UIImageView()
    let dayDegreeLabel = UILabel()
    let nightDegreeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
