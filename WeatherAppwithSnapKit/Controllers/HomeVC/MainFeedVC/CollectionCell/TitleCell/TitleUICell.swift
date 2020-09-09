//
//  ImageUICell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 31.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
extension TitleCell {
    func setupCell(){
        contentView.addSubview(titleView)
        titleView.layer.cornerRadius = 12.5
        titleView.snp.makeConstraints { (make) in
            make.size.equalToSuperview()
            make.center.equalToSuperview()
        }
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        setUpUI()
    }
    func setUpUI(){
        titleLabel.textAlignment = .center
        titleLabel.font = .robotoRegular15
        titleLabel.textColor = .slate
    }
}
