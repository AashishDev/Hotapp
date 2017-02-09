//
//  Utils.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit
import AlamofireImage

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
        let placeholderImage = UIImage(named:"")
        imgVw.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
    
}


