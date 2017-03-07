//
//  MainNavigationController.swift
//  HotApp
//
//  Created by Aashish Tyagi on 2/28/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController, UITableViewDataSource,UITableViewDelegate{

    private let cellReuseIdentifier: String = "yourCellReuseIdentifier"
    let drawerVw = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        createDrawerView()
        
    }
    
    func createDrawerView(){
        
        drawerVw.frame = CGRect(x: 0, y: 0, width: self.view.frame.width-100, height: self.view.frame.size.height)
        //drawerVw.backgroundColor = UIColor.orange
        self.view.addSubview(drawerVw)
        
        let menuTable = UITableView()
        menuTable.frame = CGRect(x: 0, y: 50, width:drawerVw.frame.width, height:drawerVw.frame.size.height-50)
        menuTable.dataSource = self
        menuTable.delegate = self
        drawerVw.addSubview(menuTable)
        hideDrawer()
    }
    
    
    func shownFrame() -> CGRect {
        var showFrame: CGRect = drawerVw.frame
        showFrame.origin.x = 0
        showFrame.origin.y = 0
        return showFrame
    }
    
    func hiddenFrame() -> CGRect {
        var hiddenFrame: CGRect = drawerVw.frame
        hiddenFrame.origin.x = -drawerVw.frame.size.width
        hiddenFrame.origin.y = 0
        return hiddenFrame
    }
    
    
    func hideDrawer() {
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            self.drawerVw.frame = self.hiddenFrame()
            //self.drawerOverlay.alpha = 0.0;
        }, completion: {(_ isFinished: Bool) -> Void in
            //[self setHidden:YES];
            //[vww deselectRowAtIndexPath:[vw indexPathForSelectedRow] animated:NO];
        })
    }
    
    func showDrawer() {
        //[self setHidden:NO];
        drawerVw.frame = self.hiddenFrame()
        // self.drawerOverlay.alpha = 0.0;
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            self.drawerVw.frame = self.shownFrame()
            //self.drawerOverlay.alpha = 1.0;
            //[vw reloadData];
        }, completion: {(_ isFinished: Bool) -> Void in
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style:UITableViewCellStyle.subtitle, reuseIdentifier:cellReuseIdentifier)
        }
        
        if(indexPath.row==0){
            cell!.textLabel!.text = "Home"
        }
        else{
            cell!.textLabel!.text = "Location"
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var navigationStack = [UIViewController]()
        navigationStack = self.viewControllers

        if(indexPath.row==0){
        
            let vc:LandingScreenVwContr = self.storyboard?.instantiateViewController(withIdentifier: "LandingScreenVwContr") as! LandingScreenVwContr
            navigationStack.append(vc)
            self.setViewControllers(navigationStack, animated: true)
        }
        else if(indexPath.row==1){
        
            
            let vc:LocationVwController = self.storyboard?.instantiateViewController(withIdentifier: "LocationVwController") as! LocationVwController
            navigationStack.append(vc)
            self.setViewControllers(navigationStack, animated: true)
        }
      
//        var FinalNavigationStack = [Any](arrayLiteral: self.viewControllers)
//        var vc: UIViewController? = FinalNavigationStack.last
//        var tapOnVideoRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.toggleControlsVisible))
//        drawerVw?.view?.addGestureRecognizer(self.tapOnVideoRecognizer)
        self.hideDrawer()
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
