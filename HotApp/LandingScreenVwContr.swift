//
//  LandingScreenVwContr.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

class LandingScreenVwContr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Utils.showAlert(title:"Alert",msg:"Monu")
        if(Validation.validateLoginField(username:"abc", password:"gfdjhgf")){
            print("Sucess!!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
