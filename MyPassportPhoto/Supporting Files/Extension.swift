//
//  Extension.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 04/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import Foundation
import UIKit




enum SlideOutState {
    case bothCollapsed
    case leftPanelExpanded
    case rightPanelExpanded
}


extension  UIViewController {
    
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
        })
        alert.addAction(ok)
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}

extension UIView {
    
    func setShadow(view: UIView, radius: Int){
        // corner radius
        view.layer.cornerRadius = CGFloat(radius)
        
        // border
        view.layer.borderWidth = 0.0
        view.layer.borderColor = UIColor.black.cgColor
        
        // shadow
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4.0
        
}
    
    
    func addShadowOnTopView(){
        //radius
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomRight, .bottomLeft], cornerRadii: CGSize(width: 20, height: 20))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        layer.masksToBounds = false
    }
}


extension UITextField
{

    func AddLeftPadding()
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
    }
    func AddImage(imageName:String)
    {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        var btnColor = UIButton(type: .custom)
      //  btnColor.addTarget(self, action: #selector(self.openEmoji), for: .TouchUpInside)
        btnColor.frame = CGRect(x: CGFloat(0), y: CGFloat(10), width: CGFloat(15), height: CGFloat(15))
        btnColor.setBackgroundImage(UIImage(named: imageName), for: .normal)
        view.addSubview(btnColor)
        self.rightView = view
        self.rightViewMode = .always
  
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
    }

}



