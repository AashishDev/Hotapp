//
//  LandingScreenVwContr.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

class LandingScreenVwContr: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var wallFeedTable: UITableView!
    let identifier = "WallFeedCell"
    let photoStr = "https://jsonplaceholder.typicode.com/photos"
    
    var photoArray = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LandingService.getPhotoList(urlString: photoStr) { (dataArray) in
           
            self.photoArray = dataArray;
           // print("Final result is: \(dataArray)")
            self.wallFeedTable.reloadData()
        }
        wallFeedTable.rowHeight = 265
    }
    
    // Table Method ***************////*******************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "WallFeedCell") as! WallFeedCell
        
        cell.wallPostCollectionVw.dataSource = self
        cell.wallPostCollectionVw.delegate = self
 
        
        if let layout = cell.wallPostCollectionVw.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemWidth = (view.bounds.width / 2.0) - 5
            let itemHeight = cell.wallPostCollectionVw.frame.size.height
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 5.0
            layout.scrollDirection = UICollectionViewScrollDirection.horizontal
            layout.invalidateLayout()
        }
        cell.wallPostCollectionVw.reloadData()
        
        return cell;
    }
    
    // Collection Method ***************////*******************
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    
        return photoArray.count;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PostCollectionCell", for: indexPath)
        
        let group = photoArray[indexPath.row]
        let imageStr = group.url
        let imageVw = cell.contentView.viewWithTag(100) as! UIImageView
        Utils.setImage(imgVw: imageVw, imageStr: imageStr, placeHolderImg: nil)

       return cell;
    }
    
}
