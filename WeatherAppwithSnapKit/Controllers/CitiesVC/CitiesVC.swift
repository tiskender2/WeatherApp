//
//  CitiesVC.swift
//  WeatherAppwithSnapKit
//
//  Created by Tolga İskender on 8.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit
import SnapKit

class CitiesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.estimatedRowHeight = UITableView.automaticDimension
            tableView.rowHeight = UITableView.automaticDimension
            tableView.register(UINib(nibName: "CitiesCell", bundle: nil), forCellReuseIdentifier: "CitiesCell")
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var continueView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    private var searchBar: UISearchBar!
    private var viewModel = CitiesVM.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConst()
        viewModel.delegates = self
        viewModel.getCities()
        setUpBavBar()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTappedContinueButton(_ sender: Any) {
        let homeVC = HomeVC()
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
           // let navController = UINavigationController(rootViewController: homeVC)
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
            appDelegate.window?.rootViewController = homeVC
            appDelegate.window?.makeKeyAndVisible()
        }
    }
    
}
// MARK:- UITableViewDataSource
extension CitiesVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].names.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return viewModel.sections.map{$0.letter}
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].letter 
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesCell", for: indexPath) as! CitiesCell
        let section = viewModel.sections[indexPath.section]
        let city = section.names[indexPath.row]
        cell.delegate = self
        cell.setCell(city: city)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
// MARK:- UITableViewDelegate
extension CitiesVC: UITableViewDelegate {
    
}
// MARK:- UI
extension CitiesVC {
    fileprivate func setUpBavBar(){
        let searchBar = UISearchBar()
        searchBar.setImage(UIImage(named: "search"), for: .search, state: .normal)
        navigationItem.titleView = searchBar
    }
    fileprivate func setContinueView(){
      
    }
}
// MARK:- CONST
extension CitiesVC {
    fileprivate func setUpConst(){
       /* stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }*/
        buttonView.layer.cornerRadius = 12
        buttonView.smoothShadow()
        continueButton.titleLabel?.font = .robotoMedium16
        continueButton.titleLabel?.textColor = .purplyBlue
        
        continueButton.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        continueView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(50)
        }
    }
}
// MARK:- DELEGATES
extension CitiesVC: CitiesVMDelegates {
    func getCitiesData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
extension CitiesVC: CitiesCellDelegate {
    func didAddButtonTapped(chosenCitiesArray: [CitiesModel]) {
        if chosenCitiesArray.count > 2 {
            showHideFilterView(duration: 0.5, hidden: false)
        } else {
            self.buttonView.isHidden = true
        }
    }
    fileprivate func showHideFilterView(duration:Double,hidden:Bool){
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 1,
                       options: [],
                       animations: {
                        self.buttonView.isHidden = hidden
                        self.stackView.layoutIfNeeded()
        },completion: nil)
    }
}



