//
//  Photo.swift
//  HotApp
//
//  Created by Aashish Tyagi on 2/7/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

class Photo: NSObject {

    var url = ""
    var title = ""
    var userid = ""
    
    init(dictionary:NSDictionary) {
        
        self.url = dictionary.value(forKey:"url") as! String
        self.title = dictionary.value(forKey:"title") as! String
    }
}
