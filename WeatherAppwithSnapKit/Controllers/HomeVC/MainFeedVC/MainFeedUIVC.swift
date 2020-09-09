//
//  MainFeedUIVC.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
enum SectionsEnum: Int,CaseIterable {
    case title = 0
    case weather
    case timeWeather
    case daily
    case weekly
}
extension MainFeedVC {
    
    func setupMainFeed(){
        viewModel.cityID = DataManager.selectedCities.first?.id
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(TitleTableCell.self, forCellReuseIdentifier: "TitleTableCell")
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
        tableView.register(TimeWeatherCell.self, forCellReuseIdentifier: "TimeWeatherCell")
        tableView.register(DailyWeatherCell.self, forCellReuseIdentifier: "DailyWeatherCell")
        tableView.register(WeeklyWeatherCell.self, forCellReuseIdentifier: "WeeklyWeatherCell")
        view.addSubview(tableView)
        tableView.backgroundColor = .paleGrey
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        let label = UILabel()
        label.text = "Hava Durumu"
        label.font = .robotoMedium18
        label.textColor = .slate
       // self.navigationController?.navigationBar.topItem?.title = "Hava Durumu"
        self.navigationController?.navigationBar.topItem?.titleView = label
    }
}
extension MainFeedVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = SectionsEnum(rawValue: indexPath.section)
        switch section {
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableCell", for: indexPath) as! TitleTableCell
            cell.collectionView.reloadData()
            cell.collectionView.selectItem(at: DataManager.lastSelectedCity, animated: false, scrollPosition: .centeredHorizontally)
            return cell
        case .weather:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
            cell.setCell(list:DataManager.detailArray?.list?[0]) // 0 her zaman  suan ki saatteki datayı dönüyor
            return cell
        case .timeWeather:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeWeatherCell", for: indexPath) as!
                TimeWeatherCell
            cell.collectionView.reloadData()
            cell.collectionView.selectItem(at: [0,0], animated: false, scrollPosition: .centeredHorizontally) // içinde bulundugumuz zaman hep ill data olarak geliyor

            return cell
        case .daily:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DailyWeatherCell", for: indexPath) as!
            DailyWeatherCell
            cell.collectionView.reloadData()
            return cell
        case .weekly:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyWeatherCell", for: indexPath) as!
            WeeklyWeatherCell
            cell.tableView.reloadData()
            return cell
        default:
            return UITableViewCell()
        }
      
    }
}
extension MainFeedVC : UITableViewDelegate {
}
