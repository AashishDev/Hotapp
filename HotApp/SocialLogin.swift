//
//  SocialLogin.swift
//  HotApp
//
//  Created by Aashish Tyagi on 2/21/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

import FacebookCore
import FacebookLogin

public class SocialLogin: NSObject {
    
    
    /******** Facebook**************************************/
    static func fbLogin(controller:UIViewController,completionBlock:@escaping (_ userInfoDictionary:NSDictionary?,_ error:NSError?) ->Void) {
        
        Utils.hideProgress()
        let loginManager = LoginManager()
        loginManager.logIn([.publicProfile], viewController: controller) { loginResult in
            
            switch loginResult {
                
            case .failed(let error):
                completionBlock(nil, error as NSError?)
            case .cancelled:
                completionBlock(nil, nil)
            //print("User Cancelled login")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                
                Utils.showProgress(msg: kFbProgressMsg)
                self.getFbUser(completionBlock: { (userInfo, error) in
                    
                    completionBlock(userInfo,nil)
                })
            // default: break
            }
        }
    }
    
    static func getFbUser(completionBlock:@escaping (_ userInfo:NSDictionary?,_ error:NSError?) ->Void) {
        
        let params = ["fields":"email,name,location,link,gender"]
        let graphRequest = GraphRequest(graphPath: "me", parameters: params)
        graphRequest.start {
            (urlResponse, requestResult) in
            
            switch requestResult {
            case .failed(let error):
                completionBlock(nil, error as NSError?)
            case .success(let graphResponse):
                if let responseDictionary = graphResponse.dictionaryValue {
                    completionBlock(responseDictionary as NSDictionary, nil)
                }
            }
        }
    }
    
    
    
    
}
