//
//  DailyWeatherCell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class DailyWeatherCell: UITableViewCell {
    let contentStackView = UIStackView()
    let titleLabel = UILabel()
    let detailView = UIView()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let imageArray = ["wind","eye","drop","clearSun"]
    let titleArray = ["Rüzgar","Görünürlük","Nem","UV"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
