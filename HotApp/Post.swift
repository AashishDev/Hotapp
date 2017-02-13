//
//  Post.swift
//  HotApp
//
//  Created by Aashish Tyagi on 2/13/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit
import SwiftyJSON

class Post: NSObject {

    var url = ""
    var name = ""
    
    init(jsonDic:JSON) {
        
        if let urlString = jsonDic["url"].string {
            self.url =  urlString
        }
        if let titleString = jsonDic["name"].string {
            self.name =  titleString
        }
    }
}
