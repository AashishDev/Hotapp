//
//  Validation.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

class Validation: NSObject {

    //1 Login Validation ****
    static func validateLoginField(username:String,password:String) -> Bool{
        
        if(username.characters.count == 0 && password.characters.count == 0){
            Utils.showAlert(title:kloginTitle, msg:kUserPassError)
            return false
        }
        else if (username.characters.count == 0 && password.characters.count != 0){
            Utils.showAlert(title:kloginTitle, msg: "Username is not empty")
            return false
        }
        else if (username.characters.count != 0 && password.characters.count == 0){
            Utils.showAlert(title:kloginTitle, msg:"Password is not empty")
            return false
        }
        else if ((password.characters.count) < 6){
            Utils.showAlert(title:kloginTitle, msg: "Password is too short")
            return false
        }
        return true
    }
    
}
