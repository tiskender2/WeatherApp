//
//  DailyWeatherUICell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
enum ItemTypeEnum: Int,CaseIterable {
    case wind = 0
    case visibility
    case humidity
    case uv
}
extension DailyWeatherCell {
    func setupCell(){
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collectionView.register(DailyDetailCell.self, forCellWithReuseIdentifier: "DailyDetailCell")
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 12
        contentStackView.setupStackView(alignment: .fill, distribution: .fill, axis: .vertical, spacing: 14, view: contentView)
        contentView.backgroundColor = .paleGrey
        
        contentStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(16)
        }
        contentStackView.addArrangedSubview(views: [setupTitleLabel(),setupView()])
    }
    fileprivate func setupTitleLabel() -> UILabel {
        titleLabel.font = .robotoMedium16
        titleLabel.textColor = .slate
        titleLabel.text = "Günlük Detay"
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
        }
        return titleLabel
    }
    fileprivate func setupView() -> UIView {
        detailView.layer.cornerRadius = 12
        detailView.smoothShadow()
        detailView.addSubview(collectionView)
        detailView.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(120)
        }
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return detailView
    }
}
extension DailyWeatherCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyDetailCell", for: indexPath) as! DailyDetailCell
        let item = ItemTypeEnum(rawValue: indexPath.row)
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.weatherImageView.image = UIImage(named: imageArray[indexPath.row])
        switch item {
        case .wind:
            cell.subTitleLabel.text = "\(DataManager.detailArray?.list?.first?.wind?.speed ?? 0.0) mhs/s"
        case .visibility:
            cell.subTitleLabel.text = "\(DataManager.detailArray?.list?.first?.visibility ?? 1000/1000) km"
        case .humidity:
            cell.subTitleLabel.text = "%\(DataManager.detailArray?.list?.first?.main?.humidity ?? 0)"
        case .uv:
            cell.subTitleLabel.text = "\(DataManager.detailArray?.list?.first?.main?.tempKf ?? 0)"
        default: break
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    /*override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        collectionView.layoutIfNeeded()
        collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width , height: 180)
        return collectionView.collectionViewLayout.collectionViewContentSize
    }*/
}
extension DailyWeatherCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      //  DataManager.lastSelectetDailyWeather = indexPath
    }
}
extension DailyWeatherCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 60, height: 30)
    }
}
