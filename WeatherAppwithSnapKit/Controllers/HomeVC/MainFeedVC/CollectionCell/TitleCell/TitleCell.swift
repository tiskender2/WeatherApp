//
//  ImageCell.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 31.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class TitleCell: UICollectionViewCell {
    var titleLabel = UILabel()
    var titleView = UIView()
    
    
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
        titleView.backgroundColor = .purplyBlue
        titleLabel.textColor = .white
        titleLabel.font = .robotoMedium16
    }
    
    func setDeselectCellUI() {
        titleView.backgroundColor = .clear
        titleLabel.textColor = .slate
        titleLabel.font = .robotoRegular15
    }
}
