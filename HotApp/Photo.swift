//
//  Photo.swift
//  HotApp
//
//  Created by Aashish Tyagi on 2/7/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

class Photo: NSObject {

    var body = ""
    var title = ""
    var userid = ""
    
    init(dictionary:NSDictionary) {
        
        self.body = dictionary.value(forKey:"body") as! String
        self.title = dictionary.value(forKey:"title") as! String
    }
}
