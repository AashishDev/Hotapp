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
        
        Utils.getFeedList { (dataArray) in
            self.photoArray = dataArray;
        }
//        LandingService.getPhotoList(urlString: photoStr) { (dataArray) in
//           
//            self.photoArray = dataArray;
//           // print("Final result is: \(dataArray)")
//            self.wallFeedTable.reloadData()
//        }
        wallFeedTable.rowHeight = 265
    }
    
    // Table Method ***************////*******************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return  self.photoArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "WallFeedCell") as! WallFeedCell
        
        let photo = photoArray[indexPath.row]
        Utils.setImage(imgVw: cell.userImageView, imageStr: photo.url, placeHolderImg: kUserPlaceholder)
        cell.userImageView.layer.borderColor = UIColor.green.cgColor
        cell.userImageView.layer.borderWidth = 0.6;
        
        cell.userName.text = photo.name
        cell.userLocation.text = photo.userLocation
        cell.postHeading.text = photo.postHeader
        cell.descriptionLbl.text = photo.descriptionText

        cell.wallPostCollectionVw.dataSource = self
        cell.wallPostCollectionVw.delegate = self
        
        if let layout = cell.wallPostCollectionVw.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemWidth = (view.bounds.width / 2.0) - 5
            let itemHeight = cell.wallPostCollectionVw.frame.size.height
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 3.0
            layout.scrollDirection = UICollectionViewScrollDirection.horizontal
            layout.invalidateLayout()
        }
        cell.wallPostCollectionVw.tag = indexPath.row
        cell.wallPostCollectionVw.reloadData()
        
        return cell;
    }
    
    // Collection Method ***************////*******************
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    
        let rowIndex = collectionView.tag
        let photo = photoArray[rowIndex]
        let postArray = photo.postArray
        return postArray.count;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print(collectionView.tag)
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PostCollectionCell", for: indexPath)
        let rowIndex = collectionView.tag
        
        let photo = photoArray[rowIndex]
        let postArray = photo.postArray
        
        let group = postArray[indexPath.row] as Post
        let imageStr = group.url
        let imageVw = cell.contentView.viewWithTag(100) as! UIImageView
        Utils.setImage(imgVw: imageVw, imageStr: imageStr, placeHolderImg: kPostPlaceholder)
        
        imageVw.layer.borderColor = UIColor.lightGray.cgColor
        imageVw.layer.borderWidth = 0.6;

       return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
       /* //instead of 568, choose the origin of your animation
        cell.frame = CGRectMake(cell.frame.origin.x,
                                cell.frame.origin.y + 568,
                                cell.frame.size.width,
                                cell.frame.size.height);
        
        [UIView animateWithDuration:0.5 delay:0.1*indexPath.row options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //instead of -30, choose how much you want the cell to get "under" the cell above
            cell.frame = CGRectMake(myRect.origin.x,
            myRect.origin.y - 30,
            myRect.size.width,
            myRect.size.height);
            
            } completion:^(BOOL finished){
            [UIView animateWithDuration:0.5 animations:^{
            cell.frame = myRect;
            }];
            
            }];*/
        
        cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
        
        
        
        
    }
    
}
