//
//  Photo.swift
//  HotApp
//
//  Created by Aashish Tyagi on 2/7/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit
import SwiftyJSON

class Photo: NSObject {
    
    var url = ""
    var name = ""
    var userLocation = ""
    var postHeader = ""
    var descriptionText = ""
    var postArray = [Post]()
    
    init(jsonDic:JSON) {
        
        if let urlString = jsonDic["url"].string {
            self.url =  urlString
        }
        if let titleString = jsonDic["name"].string {
            self.name =  titleString
        }
        if let locationString = jsonDic["userLocation"].string {
            self.userLocation =  locationString
        }
        if let postHeaderString = jsonDic["postHeader"].string {
            self.postHeader =  postHeaderString
        }
        if let descripString = jsonDic["description"].string {
            self.descriptionText =  descripString
        }
        if let postArr = jsonDic["post"].array {
            
            var arrData =  [Post]()
            for result in postArr {
                
                let post =  Post(jsonDic:result)
                arrData.append(post)
            }
            self.postArray =  arrData
        }
    }
}
