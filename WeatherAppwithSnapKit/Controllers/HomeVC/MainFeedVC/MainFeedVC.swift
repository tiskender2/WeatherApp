//
//  MainFeedVC.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MainFeedVC: UIViewController {
    var tableView = UITableView()
    var sections = SectionsEnum.allCases
    var viewModel = MainFeedVM.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupMainFeed()
    }
}
extension MainFeedVC: MainFeedVMDelegates {
    func getDetailData() {
        print( DataManager.weekDayArray)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
