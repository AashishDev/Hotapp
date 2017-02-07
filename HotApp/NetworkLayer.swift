//
//  ServerHelper.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

public class NetworkLayer: NSObject {
    
    // 1 GET REQUEST
    static func getRequest(urlString:String,parameter:NSDictionary?,completion:@escaping (_ result:JSON?, _ error:NSError?) -> Void){
        
        Alamofire.request(urlString, method: .get, parameters: parameter as? Parameters, headers: nil).responseJSON {
            (response:DataResponse<Any>) in
            
            switch response.result
            {
            case .success(_):
                let responseDictionary = JSON(response.result.value!)
                completion(responseDictionary, nil)
            case .failure(_):
                completion(nil, response.result.error as NSError?)
            }
            
            //print("Response is : \(response.result.value)")
           // let responseDictionary = JSON(response.result.value!)
            //print("Response AFTER PARSE is : \(responseDictionary)")
        }
    }
    
}
