//
//  HomeUIVC.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 9.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import Foundation
import UIKit

extension HomeVC {
    func setupTabbar(){
        tabbarControllers()
    }
    
}
extension HomeVC {
    fileprivate func tabbarControllers(){
        let mainFeedVC = MainFeedVC()
        let navMainFeed = UINavigationController(rootViewController: mainFeedVC)
        mainFeedVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let cityVC = CityVC()
        let navCityVC = UINavigationController(rootViewController: cityVC)
        cityVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        let tabBarList = [navMainFeed, navCityVC]
        viewControllers = tabBarList
        //self.selectedIndex = 0
    }
}
