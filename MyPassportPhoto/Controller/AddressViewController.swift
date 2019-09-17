//
//  AddressViewController.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 04/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    
    //MARK:- Properties
    
    @IBOutlet var txtCountry: UITextField!
    @IBOutlet var txtType: UITextField!
    @IBOutlet var txtAddress: UITextField!
    @IBOutlet var txtCity: UITextField!
    @IBOutlet var txtZipCode: UITextField!
    @IBOutlet var txtState: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customInit()
    }
    
    
    //MARK:- Back Action
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyOrderViewController")as! MyOrderViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- Function
    
    func customInit(){
        self.txtCountry.setShadow(view: self.txtCountry, radius: 20)
        self.txtCountry.AddImage(imageName: "img_dropDown")
        
        self.txtType.setShadow(view: self.txtType, radius: 20)
        self.txtType.AddLeftPadding()
        
        self.txtAddress.setShadow(view: self.txtAddress, radius: 20)
        self.txtAddress.AddLeftPadding()
        
        self.txtCity.setShadow(view: self.txtCity, radius: 20)
        self.txtCity.AddLeftPadding()
        
        self.txtZipCode.setShadow(view: self.txtZipCode, radius: 20)
        self.txtZipCode.AddLeftPadding()
        
       self.txtState.setShadow(view: self.txtState, radius: 20)
        self.txtState.AddLeftPadding()
       
    }

}
