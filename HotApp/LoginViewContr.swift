//
//  LoginViewContr.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit


class LoginViewContr: UIViewController {

    @IBOutlet var yourNameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        
        if (yourNameText.text?.characters.count)! > 0 {
        
            let landingScreen = self.storyboard?.instantiateViewController(withIdentifier: "LandingScreenVwContr")
            self.navigationController?.pushViewController(landingScreen!, animated: true)
        }
    }
    
    // 1 Facebook Login
    @IBAction func fbLoginTapped(_ sender: UIButton) {
        
        Utils.showProgress(msg: kProgressMsg)
        SocialLogin.fbLogin(controller: self) { (userInfo, error) in
            if error == nil {
                print("Fb Login : \(userInfo!)")
                if let name:String = userInfo?["name"] as! String? {
                
                    self.yourNameText.text = name
                }
                
               
                Utils.hideProgress()
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
