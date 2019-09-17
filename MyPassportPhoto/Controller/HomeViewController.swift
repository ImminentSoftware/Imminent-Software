//
//  HomeViewController.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 04/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit
import ABSteppedProgressBar
import LGSideMenuController


var photoTypeModel = [photoType]()
var copiesVModel = [copiesViewModel]()
var SelectedImageInd = 0

class HomeViewController: UIViewController ,UINavigationControllerDelegate{
    
    //MARK:- Properties
    @IBOutlet var topView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var progressView: ABSteppedProgressBar!
    
    
    
    //MARK:- Variables
    var selectedIndex = IndexPath()
    var arr : [String] = ["Select Photo Type"]
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        print("Hi")
        // set image_container_view...
        self.tableView.reloadData()
        self.progressView.currentIndex = 0
        self.progressView.delegate = self
        self.callImageData()
    }
    
    
    //MARK:- Action
    
    @IBAction func nextAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GeneralInfoViewController")as! GeneralInfoViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func settingsAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")as! SettingsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func AddNewAction(_ sender: UIButton) {
        
        if (arr.count < 5){
        self.arr.insert("Select Photo Type", at: 0)
        //
        photoTypeArr.append(photoTypeModel)
        selectedTypeArr.append("")
        selectedCoDimension.append("")
        selectedNoCopies.append("")
        selectedEditPhoto.append("")
        
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [IndexPath.init(row: arr.count-1, section: 0)], with: .automatic)
        self.tableView.endUpdates()
        self.tableView.scrollToRow(at: IndexPath.init(row: arr.count-1, section: 0), at: .bottom, animated: true)
        }else{
            self.showAlert(withTitle: "My Passport Photo", withMessage: "You can not Add more than five Photos")
        }
    }
    
    @IBAction func removeAction(_ sender: UIButton) {
        
        tableView.beginUpdates()//optional
        self.arr.remove(at: sender.tag)
        //
        selectedTypeArr.remove(at: sender.tag)
        selectedCoDimension.remove(at: sender.tag)
        selectedNoCopies.remove(at: sender.tag)
        selectedEditPhoto.remove(at: sender.tag)
        photoTypeArr.remove(at: sender.tag)
        
        tableView.deleteRows(at: [IndexPath.init(row: sender.tag, section: 0)], with: .fade)
        //TODO ... add your code to update data source here
        
        tableView.endUpdates()//
    }
    
    @IBAction func menuAction(_ sender: UIButton) {
        self.showLeftView(self)
    }
    
    
    @IBAction func selectImageAction(_ sender: UIButton) {
        //
        
        SelectedImageInd = sender.tag
        let actionSheetController: UIAlertController = UIAlertController(title: "My Passport Photo", message: nil, preferredStyle: .actionSheet)
        
        let galleryAction: UIAlertAction = UIAlertAction(title: "Select Photo from Gallery", style: .default) { action -> Void in
            
            self.picker.delegate = self
            self.picker.allowsEditing = true
            self.picker.sourceType = UIImagePickerController.SourceType.photoLibrary
            //self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum)!
            
            self.present(self.picker, animated: true, completion: nil)
            
        }
        let cameraAction: UIAlertAction = UIAlertAction(title: "Take Photo", style: .default) { action -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                
                self.picker.delegate = self
                self.picker.allowsEditing = true
                self.picker.sourceType = UIImagePickerController.SourceType.camera
                //self.picker.cameraCaptureMode = .photo
                //self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
                //self.picker.modalPresentationStyle = .fullScreen
                
                self.present(self.picker,animated: true,completion: nil)
                
            }else{
                self.noCamera()
            }
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
        
        actionSheetController.addAction(galleryAction)
        actionSheetController.addAction(cameraAction)
        actionSheetController.addAction(cancelAction)
        
        // Remove arrow from action sheet.
        actionSheetController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        
        //For set action sheet to middle of view.
        actionSheetController.popoverPresentationController?.sourceView = self.view
        actionSheetController.popoverPresentationController?.sourceRect = self.view.bounds
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    
    //MARK:- Function
    
    func noCamera() {
        let alertController = UIAlertController(title: "Connect Guru", message: "Sorry this device has no camera.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    //MARK:- WebService
    
    func callImageData(){
        ApiInteraction.sharedInstance.getAllImageInfo { (data, status, error) in
            print(data)
            
            photoTypeModel = data.photo_types!
            photoTypeArr.append(photoTypeModel)
            copiesVModel = totalCopiesModel.map({ return copiesViewModel(copies: $0) }) ?? []
            self.tableView.reloadData()
        }
    }
    
    
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath)as! HomeTableViewCell
        //
        cell.selectionStyle = .none
        cell.txtType.tag = indexPath.row
        cell.txtDimension.tag = indexPath.row
        cell.txtCopiesNum.tag = indexPath.row
        cell.txtExpertPhoto.tag = indexPath.row
        cell.btn_Image.tag = indexPath.row
        // set PhotoType Drop Down Values
        
        cell.txtType.text = selectedTypeArr[indexPath.row]
        cell.txtDimension.text = selectedCoDimension[indexPath.row]
        cell.txtCopiesNum.text = selectedNoCopies[indexPath.row]
        cell.txtExpertPhoto.text = selectedEditPhoto[indexPath.row]
        
        var photoArray : [String] = []
        var photoID : [Int] = []
        
        if photoTypeArr.count>0 {
        for type in photoTypeArr[indexPath.row]{
            photoArray.append(type.name ?? "")
            photoID.append(Int(type.id ?? "") ?? 0)
        }
        }else{
            
        }
        cell.txtType.placeholder = arr[indexPath.row]
        
        cell.txtType.optionArray = photoArray
        //Its Id Values and its optional
        cell.txtType.optionIds = photoID
        
        
        
        
        //Set Number of Copies Drop Down Vlaues
        var copiesArray : [String] = []
        var copiesId : [Int] = []
        
        for copies in totalCopiesModel{
            copiesArray.append(copies.name ?? "")
            copiesId.append(Int(copies.id ?? "") ?? 0)
        }
        
        cell.txtCopiesNum.optionArray = copiesArray
        //Its Id Values and its optional
        cell.txtCopiesNum.optionIds = copiesId
        
        
        //Set Expert Photo
        
        cell.txtExpertPhoto.optionArray = ["Yes - Add USD 3.99","No"]
        
        //
        cell.lbl_Number.text = "Photo #\(indexPath.row+1)"
        cell.btnRemove.tag = indexPath.row
        if (indexPath.row  == 0){
            cell.heigtht_Remove.constant = 0
        }else{
            cell.heigtht_Remove.constant = 44
        }
        if arr.count > 0 {
            if indexPath.row == arr.count - 1{
                cell.height_AddNew.constant = 40
                cell.height_next.constant = 44
                
            }else{
                cell.height_AddNew.constant = 0
                cell.height_next.constant = 0
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arr.count > 0 {
            if indexPath.row == arr.count - 1{
                return 790
            }else if indexPath.row == 0{
                return 700
            }else{
                return 740
            }
        }else{
            return 790
        }
        
    }
}

extension HomeViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == ""{
            
            arr[textField.tag] = "Select Photo Type"
        }
        return true
    }
}

extension HomeViewController: ABSteppedProgressBarDelegate{
    
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


// MARK: - ImagePicker Delegate
extension HomeViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: IndexPath(row: SelectedImageInd, section: 0))
        
        if let pickedImage = info[.editedImage] as? UIImage {
            cell.imageView?.image = pickedImage
            
        }else {
            
        }
        self.dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
