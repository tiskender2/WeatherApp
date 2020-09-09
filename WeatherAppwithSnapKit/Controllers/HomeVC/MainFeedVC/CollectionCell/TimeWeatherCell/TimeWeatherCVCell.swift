//
//  TimeWeatherCVCell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class TimeWeatherCVCell: UICollectionViewCell {
    var contentStackView = UIStackView()
    var backView = UIView()
    var weatherImageView = UIImageView()
    var timeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            self.isSelected ? setSelectedCellUI() : setDeselectCellUI()
        }
    }
    func setSelectedCellUI() {
        backView.backgroundColor = .purplyBlue
    }
    
    func setDeselectCellUI() {
        backView.backgroundColor = .white
    }
    func setCell(list:List?){
        guard let date =  list?.dtTxt?.dateFormatterString() else { return }
        weatherImageView.image = UIImage(named: list?.weather?.first?.main ?? "sun3")
        timeLabel.text = "\(date.get(.hour)):\(date.get(.minute))"
       /* let currentDate = DataManager.detailArray?.list?.first?.dtTxt?.dateFormatterString()
        if currentDate?.get(.hour) == Date().get(.hour) {
            backView.backgroundColor = .purplyBlue
        } else {
            backView.backgroundColor = .white
        }*/
        
    }
}
