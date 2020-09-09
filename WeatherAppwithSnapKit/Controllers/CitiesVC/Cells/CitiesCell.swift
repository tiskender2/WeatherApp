//
//  CitiesCell.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 8.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit
protocol CitiesCellDelegate: class {
    func didAddButtonTapped(chosenCitiesArray:[CitiesModel])
}
class CitiesCell: UITableViewCell {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    weak var delegate: CitiesCellDelegate?
    var city:CitiesModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeUI()
        addConstToStackView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didTappedAddButton(_ sender: Any) {
        guard let city = self.city else {return}
        
        if city.isAdded != true {
            city.isAdded = true
            addButton.setTitle("Eklendi", for: .normal)
            DataManager.selectedCities.append(city)
        } else {
            city.isAdded = false
            addButton.setTitle("Ekle", for: .normal)
            for i in 0..<DataManager.selectedCities.count {
                if DataManager.selectedCities[i].id == city.id {
                   DataManager.selectedCities.remove(at: i)
                }
            }
        }
        delegate?.didAddButtonTapped(chosenCitiesArray: DataManager.selectedCities)
    }
    func setCell(city:CitiesModel?){
        self.city = city
        if city?.isAdded == true {
            addButton.setTitle("Eklendi", for: .normal)
        } else {
            addButton.setTitle("Ekle", for: .normal)
        }
        cityNameLabel.text = city?.name
    }
    func customizeUI(){
        contentView.backgroundColor = .paleGrey
        addButton.tintColor = .purplyBlue
        addButton.titleLabel?.font = .robotoMedium14
        cityNameLabel.font = .robotoMedium14
        cityNameLabel.tintColor = .slate
    }
}
// MARK:- CONSTRAINT
extension CitiesCell {
    fileprivate func addConstToStackView(){
        stackView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
    }
}
