//
//  LoginViewContr.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class LoginViewContr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        
        //let landingScreen = self.storyboard?.instantiateViewController(withIdentifier: "LandingScreenVwContr")
       // self.navigationController?.pushViewController(landingScreen!, animated: true)
    }
    
    
    @IBAction func fbLoginTapped(_ sender: UIButton) {
        
        let loginManager = LoginManager()
        loginManager.logIn([.publicProfile], viewController: self) { loginResult in
            
            switch loginResult {
            
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User Cancelled login")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
            //print("Access Token is : \(accessToken)")
                self.getUserData()
            default: break
            }
            
        }
        
    }
    
    //1 Get User Details
    func getUserData()
    {
        let params = ["fields" :"email,name,location,link,gender"]
        let graphRequest = GraphRequest(graphPath: "me", parameters: params)
        graphRequest.start {
            (urlResponse, requestResult) in
            
            switch requestResult {
            case .failed(let error):
                print("error in graph request:", error)
                break
            case .success(let graphResponse):
                if let responseDictionary = graphResponse.dictionaryValue {
                    print("\nResponse is : \(responseDictionary)")
                    //print("Email id :\(responseDictionary["email"]!)")
                }
            }
        }
        
    }
    
    
    
    
    @IBAction func gPlusLoginTapped(_ sender: UIButton) {
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
