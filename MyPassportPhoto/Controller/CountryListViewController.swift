//
//  CountryListViewController.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 13/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit
import Kingfisher



var countriesSections: [[countryCodeViewModel]] = [[]]
var sortedFirstLetters: [String] = []

class CountryListViewController: UIViewController {

    //MARK:- Properties
    
    @IBOutlet var tableView: UITableView!

    
    //Mark:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            
            let firstLetters = countryCodeList.map { $0.titleFirstLetter ?? "" }
            let uniqueFirstLetters = Array(Set(firstLetters))
            
            sortedFirstLetters = uniqueFirstLetters.sorted()
            countriesSections = sortedFirstLetters.map { firstLetter in
                return countryCodeList
                    .filter { $0.titleFirstLetter == firstLetter }
                    .sorted { $0.name! < $1.name! }
            }
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
        
        self.tableView.setShadow(view: self.tableView, radius: 5)
    }
    
    
    
    //MARK:- Action
    
    
    @IBAction func crossButtonClicked(_ sender: Any) {
        //
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
        
    }
    
    
    //MARK:- WebService
 
    
}


extension CountryListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath)as! CountryTableViewCell
        let name = countriesSections[indexPath.section][indexPath.row]
        cell.lblCountry.text = name.name
        
        let image = name.flag ?? ""
        let imageString = URL(string: kFlagBaseUrl+image)
        cell.img_flag.kf.setImage(with: imageString)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sortedFirstLetters.count > 0 {
            return sortedFirstLetters[section]
        }else{
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let code = countriesSections[indexPath.section][indexPath.row]
        selectedCountryCode = code.dial_code ?? ""
         NotificationCenter.default.post(name: Notification.Name("refreshCountryCode"), object: nil)
        //
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if sortedFirstLetters.count > 0 {
            return sortedFirstLetters
        }else{
            return [""]
        }
        return sortedFirstLetters
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countriesSections.count
    }
}

