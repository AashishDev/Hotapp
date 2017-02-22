//
//  Utils.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage
import SVProgressHUD

class Utils: NSObject {
    

    //1 Alert
    static func showAlert(title:String,msg:String) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"Okay", style: UIAlertActionStyle.default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    //2 Set Image by Url
    static func setImage(imgVw:UIImageView,imageStr:String,placeHolderImg:String?) {
        
        let url = URL(string:imageStr)!
        let placeholderImage = UIImage(named:placeHolderImg!)
        imgVw.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
    
    
    static func getFeedList(completion:@escaping (_ photoList:[Photo]) -> Void){
    
        if let path = Bundle.main.path(forResource: "feedPost", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    
                    //print("jsonData:\(jsonObj)")
                    var arrData =  [Photo]()
                    for result in jsonObj["person"].arrayValue {
                       
                        let comment =  Photo(jsonDic:result)
                        arrData.append(comment)
                    }
                    completion(arrData)
                    print("arrray:\(arrData)")
                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    
    static func showProgress(msg:String) {
    
        SVProgressHUD.show(withStatus: msg)
    }
    
    
    static func hideProgress() {
        
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    
}


