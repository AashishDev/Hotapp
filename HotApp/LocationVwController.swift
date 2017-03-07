//
//  LocationVwController.swift
//  HotApp
//
//  Created by Aashish Tyagi on 2/23/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

class LocationVwController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func slideMenuBtnTapped(_ sender: UIButton) {
        
        let navController = self.navigationController as! MainNavigationController?
        navController?.showDrawer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
