//
//  LoginViewContr.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit


class LoginViewContr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        
        //let landingScreen = self.storyboard?.instantiateViewController(withIdentifier: "LandingScreenVwContr")
       // self.navigationController?.pushViewController(landingScreen!, animated: true)
    }
    
    // 1 Facebook Login
    @IBAction func fbLoginTapped(_ sender: UIButton) {
        
        SocialLogin.fbLogin(controller: self) { (userInfo, error) in
            if error == nil {
                print("Fb Login : \(userInfo!)")
            }
        }
    }
    
    // 2 G+ Login
    @IBAction func gPlusLoginTapped(_ sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
