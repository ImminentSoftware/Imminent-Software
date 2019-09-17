//
//  ImageModelView.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 11/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import Foundation
import  UIKit


class ImageModel: NSObject , Codable {
    
    var photo_types : [photoType]? = []
    var no_of_copies: [no_of_copies]? = []
    var country_codes: [countryCodes]? = []
    var country_currencies: [countryCurrencies]? = []
}

class photoType: NSObject , Codable {
    
    var id : String? = ""
    var name : String? = ""
    var created_at : String? = ""
    var updated_at : String? = ""
    var attributes : [attributes] = []
}


class attributes: NSObject , Codable {
    
    var id : String? = ""
    var photo_type : String? = ""
    var country : String? = ""
    var dimensions : String? = ""
    var photo_type_id : String? = ""
}

class no_of_copies: NSObject , Codable {
    
    var id : String? = ""
    var name : String? = ""
    var price : String? = ""
}

class countryCodes: NSObject , Codable {
    
    var id : String? = ""
    var name : String? = ""
    var flag : String? = ""
    var dial_code : String? = ""
    var titleFirstLetter: String {
        return String(self.name![self.name!.startIndex]).uppercased()
    }
    

}

class countryCurrencies: NSObject , Codable {
    
    var id : String? = ""
    var title : String? = ""
}

