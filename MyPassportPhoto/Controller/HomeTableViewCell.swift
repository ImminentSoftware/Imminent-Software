//
//  HomeTableViewCell.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 06/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit
import iOSDropDown

//MARK:- Variables

var selectedTypeArr = [""]
var selectedCoDimension = [""]
var selectedNoCopies = [""]
var selectedEditPhoto = [""]
var photoTypeArr = [[photoType]]()

class HomeTableViewCell: UITableViewCell , UITextFieldDelegate{
    
    
    //MARK:- Properties
    @IBOutlet var viewImage: UIImageView!
    @IBOutlet var imageFrame: UIView!
    @IBOutlet var txtType: DropDown!
    @IBOutlet var txtDimension: DropDown!
    @IBOutlet var txtCopiesNum: DropDown!
    @IBOutlet var txtExpertPhoto: DropDown!
    @IBOutlet var view_Bg: UIView!
    @IBOutlet var btnRemove: UIButton!
    @IBOutlet var height_next: NSLayoutConstraint!
    @IBOutlet var height_AddNew: NSLayoutConstraint!
    @IBOutlet var heigtht_Remove: NSLayoutConstraint!
    @IBOutlet var lbl_Number: UILabel!
    @IBOutlet var btn_Image: UIButton!
    
    //MARK:- Variables
    var selectedType = [0]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.txtType.setShadow(view: self.txtType, radius: 5)
        self.txtDimension.setShadow(view: self.txtDimension, radius: 5)
        self.txtCopiesNum.setShadow(view: self.txtCopiesNum, radius: 5)
        self.txtExpertPhoto.setShadow(view: self.txtExpertPhoto, radius: 5)
        self.txtDimension.AddLeftPadding()
        self.txtCopiesNum.AddLeftPadding()
        self.txtType.AddLeftPadding()
        self.txtExpertPhoto.AddLeftPadding()
        self.view_Bg.layer.cornerRadius = 10.0
        self.view_Bg.layer.borderWidth = 1.0
        self.view_Bg.layer.borderColor = UIColor.lightGray.cgColor
        // The list of array to display. Can be changed dynamically
       

        // The list of array to display. Can be changed dynamically
        txtExpertPhoto.optionArray = ["YES Add USD - 3.99", "No"]
        //Its Id Values and its optional
        txtExpertPhoto.optionIds = [1,2]
    
        
        
        
        // Select Photo Type and add values of dimension according to Type
        txtType.didSelect{(selectedText , index ,id) in
            
            print("Selected String: \(selectedText) \n index: \(index)")
            self.selectedType.insert(id, at: self.txtType.tag)
            var photoDimension  = [String]()
            var dimensionIds = [Int]()
            
            
            if photoTypeModel.count > 0 {
                for dimension in photoTypeModel[(self.selectedType[self.txtType.tag])].attributes {
                    photoDimension.append(dimension.dimensions ?? "")
                     dimensionIds.append(Int(dimension.id ?? "") ?? 0)
                    }
                
                }
                self.txtDimension.optionArray = photoDimension
                self.txtDimension.optionIds = dimensionIds as? [Int]
                self.txtDimension.text = ""
            // Save Value
                selectedTypeArr[self.txtType.tag] = selectedText
                photoTypeArr[self.txtType.tag] = photoTypeModel
            }
        
        txtDimension.didSelect { (selectedText, index, id) in
             selectedCoDimension[self.txtDimension.tag] = selectedText
        }
        
        txtCopiesNum.didSelect { (selectedText, index, id) in
            selectedNoCopies[self.txtCopiesNum.tag] = selectedText
        }

        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
}
