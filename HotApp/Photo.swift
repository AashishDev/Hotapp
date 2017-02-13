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
    var postArray = [Post]()
    
    init(jsonDic:JSON) {
        
        if let urlString = jsonDic["url"].string {
            self.url =  urlString
        }
        if let titleString = jsonDic["name"].string {
            self.name =  titleString
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
