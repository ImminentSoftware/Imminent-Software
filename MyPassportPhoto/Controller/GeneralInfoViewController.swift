//
//  GeneralInfoViewController.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 04/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit
import ABSteppedProgressBar
import iOSDropDown


var selectedCountryCode = "91"

class GeneralInfoViewController: UIViewController {

    
    //MARK:- Properties
    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtFName: UITextField!
    @IBOutlet var txtlName: UITextField!
    @IBOutlet var txtNumber: UITextField!
    @IBOutlet var txtDelivaryMethod: DropDown!
    @IBOutlet var txtCurrency: UITextField!
    @IBOutlet var view_number: UIView!
    @IBOutlet var progressView: ABSteppedProgressBar!
    @IBOutlet var lbl_code: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set leftMenuSetup...
       self.customInit()
        self.progressView.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.progressView.currentIndex = 1
        }
        // register to receive notification...
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshCountry), name:  Notification.Name("refreshCountryCode"), object: nil)
        
    }
    
    //MARK:- Action
    
    @IBAction func nextAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddressViewController")as! AddressViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectCodeAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CountryListViewController")as! CountryListViewController
        
        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    
    //MARK:- Function
    
    func customInit(){
        
        self.txtEmail.setShadow(view: self.txtEmail, radius: 5)
        self.txtEmail.AddLeftPadding()
        self.txtFName.setShadow(view: self.txtFName, radius: 5)
        self.txtFName.AddLeftPadding()
        self.txtlName.setShadow(view: self.txtlName, radius: 5)
        self.txtlName.AddLeftPadding()
        self.txtNumber.AddImage(imageName: "img_dropDown")
        self.txtDelivaryMethod.setShadow(view: self.txtDelivaryMethod, radius: 5)
        
        self.view_number.setShadow(view: self.view_number, radius: 5)
        self.txtCurrency.setShadow(view: self.txtCurrency, radius: 5)
        self.txtCurrency.AddImage(imageName: "img_dropDown")
        
        
        // Selection Delivery Menthod
        self.txtDelivaryMethod.optionArray = ["Next Day Pickup(Recommended) - USD 2.99","Home Delivery - USD 2.99"]
        
        txtDelivaryMethod.didSelect { (method, index, id) in
            if (index == 1){
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddressViewController")as! AddressViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeAddressViewController")as! HomeAddressViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @objc func refreshCountry(){
        self.lbl_code.text = "+ "+selectedCountryCode
    }
}
extension GeneralInfoViewController: ABSteppedProgressBarDelegate{
    
    func progressBar(_ progressBar: ABSteppedProgressBar, textAtIndex index: Int) -> String {
        switch index {
        case 0:
            return "1"
        case 1:
            return "2"
        default:
            return "3"
            
        }
    }
}
