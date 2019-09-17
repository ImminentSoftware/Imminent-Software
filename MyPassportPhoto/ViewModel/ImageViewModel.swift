//
//  ImageViewModel.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 11/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit



class attributesViewModel: NSObject {
    
    var id : String? = ""
    var photo_type : String? = ""
    var country : String? = ""
    var dimensions : String? = ""
    var photo_type_id : String? = ""
    
    override init(){
    }
    init(attribute: attributes){
        self.id = attribute.id
        self.photo_type = attribute.photo_type
        self.country = attribute.country
        self.dimensions = attribute.dimensions
        self.photo_type_id = attribute.photo_type_id
    }
    
    
}

class copiesViewModel: NSObject {
    
    var id : String? = ""
    var name : String? = ""
    var price : String? = ""
    
    override init(){
    }
    init(copies: no_of_copies){
        self.id = copies.id
        self.name = copies.name
        self.price = copies.price
    }
    
    
}

class countryCodeViewModel: NSObject {
    
    var id : String? = ""
    var name : String? = ""
    var flag : String? = ""
    var dial_code : String? = ""
    
    var titleFirstLetter: String {
        return String(self.name![self.name!.startIndex]).uppercased()
    }
    
    override init(){
    }
    init(code: countryCodes){
        self.id = code.id
        self.name = code.name
        self.flag = code.flag
        self.dial_code = code.dial_code
       // self.titleFirstLetter = code.titleFirstLetter
    }
    
    
}



class currenciesViewModel: NSObject {
    
    var id : String? = ""
    var title : String? = ""
    
    override init(){
    }
    init(currency: countryCurrencies){
        self.id = currency.id
        self.title = currency.title
    }
    
    
}
