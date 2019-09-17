//
//  SettingsViewController.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 04/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit


protocol SidePanelViewControllerDelegate: class{
   func didSelect()
}
class SettingsViewController: UIViewController {

    //MARK:- Properties
    
    @IBOutlet var topView: UIView!
    @IBOutlet var tableView: UITableView!
    let arr = ["About", "Privacy Policy", "Terms & Conditions", "Help"]
    let iconArr = [UIImage(named: "img_about"),UIImage(named: "img_privacy"),UIImage(named: "img_terms"),UIImage(named: "img_help")]
    
    var delegate: SidePanelViewControllerDelegate?
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
       self.tableView.reloadData()
       
    }
    

}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = arr[indexPath.row]
        cell.imageView?.image = iconArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
