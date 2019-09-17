//
//  ApiInteraction.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 11/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit
import Alamofire

var imageData = ImageModel()
var totalCopiesModel = [no_of_copies]()
var countryCurrList = [currenciesViewModel]()
var countryCodeList = [countryCodeViewModel]()

class ApiInteraction: NSObject {
    static let sharedInstance = ApiInteraction()
    
    func getAllImageInfo(completionHandler : @escaping (_ data : ImageModel,_ status : Bool ,_ error : String? )-> Void){
        
        let url = kBaseAddress + "getData"
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON { responce in
           // SVProgressHUD.dismiss()
            switch responce.result {
            case .success:
                if responce.result.value != nil {
                    if responce.result.value != nil {
                        print("Data Received")
                        let result : [String : Any] = responce.result.value as! [String: Any]
                        print(result)
                        
                        let dict =  ((responce.result.value as! NSDictionary)["response"]as! NSDictionary)["data"]as! NSDictionary
                        
                        let data = try! JSONSerialization.data(withJSONObject: dict)
                        
                        
                        do {
                            
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .secondsSince1970
                            
                           imageData =  try decoder.decode(ImageModel.self, from: data)

                            for types in imageData.photo_types!{
                                photoTypeModel.append(types)
                            }
                            
                            for copies in imageData.no_of_copies!{
                                totalCopiesModel.append(copies)
                            }
                       
                            for currency in imageData.country_currencies!{
                                countryCurrList.append(currenciesViewModel(currency: currency))
                            }
                            for code in imageData.country_codes!{
                                countryCodeList.append(countryCodeViewModel(code: code))
                            }
                            
                            DispatchQueue.main.async {
                              completionHandler(imageData, true, nil)
                            }
                            
                            
                        } catch let error {
                            // self.showAlert(message: "\(error.localizedDescription)", title: "imi")
                         //   self.view.DismissLoader(view: self.view)
                            print("\(error.localizedDescription)")
                        }
                        
                        
                    }
                        
                    else
                    {
                        print("No Data")
                    }
                    
                }
                else
                {
                    print("No Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    
}
