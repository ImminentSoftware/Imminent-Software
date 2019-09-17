//
//  SelectedViewController.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 10/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit


protocol selectedValProtocol : class{
    func selectedal(repeatval: String)
}

class SelectedViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
    weak var delegate : selectedValProtocol?
    var repeatTime = NSArray()
    var checked = [Bool]()
    
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        repeatTime = ["After 1 Hour","After 2 Hour","After 3 Hour","After 4 Hour"]
        checked = Array(repeating: false, count: repeatTime.count)
        
        self.tableView.reloadData()
    }
    
    //MARK:- Function
    
    func BackAction(){
        //
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    //MARK:- Action
    
    @IBAction func backAction(_ sender: Any) {
        self.BackAction()
    }
    
    
}


extension SelectedViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repeatTime.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        //configure you cell here.
        if checked[indexPath.row] == false{
            cell.accessoryType = .none
        } else if checked[indexPath.row] {
            cell.accessoryType = .checkmark
        }
        
        
        cell.textLabel?.text = repeatTime[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                checked[indexPath.row] = false
                self.delegate?.selectedal(repeatval: "")
            } else {
                cell.accessoryType = .checkmark
                checked[indexPath.row] = true
                self.delegate?.selectedal(repeatval: repeatTime[indexPath.row] as! String)
            }
            self.BackAction()
        }
    }
}
