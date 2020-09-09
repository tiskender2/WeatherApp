//
//  CustomSearchBar.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 8.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
class CustomSearchBar: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var searchTextView: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    var didCouponButtonClicked: (()->())?
    var didCopyButtonClicked: (()->())?
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("CustomSearchBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        imageView.image = UIImage(named: "search")
    }
}
extension CustomSearchBar {
    fileprivate func addConst(){
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(20)
        }
    }
}
