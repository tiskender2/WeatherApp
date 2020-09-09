//
//  SplashVC.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 8.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit
import SnapKit
class SplashVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstToImageView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            let citiesVC = CitiesVC(nibName: "CitiesVC", bundle: nil)
            let navController = UINavigationController(rootViewController: citiesVC)
            self?.window = UIWindow(frame: UIScreen.main.bounds)
            self?.window?.rootViewController = navController
            self?.window?.makeKeyAndVisible()
           
            self?.navigationController?.pushViewController(citiesVC, animated: true)
        }
    }
}
extension SplashVC {
    fileprivate func addConstToImageView(){
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
    }
}
