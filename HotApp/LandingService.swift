//
//  LandingService.swift
//  HotApp
//
//  Created by Aashish Tyagi on 2/7/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

public class LandingService: NSObject {
    
    static func getPhotoList(urlString:String,completion:@escaping (_ photoList:[Photo]) -> Void)  {
       
        NetworkLayer.getRequest(urlString: urlString, parameter: nil) { (response, error) in
          
            var photoList =  [Photo]()
            let dataArray: NSArray = (response!.arrayObject)! as NSArray
            for dataValue in dataArray {
                
               // let photo = Photo(jsonDic: dataValue as! NSDictionary)
               // photoList.append(photo)
            }
            completion(photoList)
        }
    }

    
}
