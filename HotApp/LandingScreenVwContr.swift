//
//  LandingScreenVwContr.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/18/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
// https://ios.uplabs.com/posts/instant-photo-splash-screen-freebie

import UIKit

class LandingScreenVwContr: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var wallFeedTable: UITableView!
    let identifier = "WallFeedCell"
    let photoStr = "https://jsonplaceholder.typicode.com/photos"

    var animatedIndex = [IndexPath]()
    var photoArray = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utils.getFeedList { (dataArray) in
            self.photoArray = dataArray;
        }
        wallFeedTable.rowHeight = 230
    }
    
    // Table Method ***************////*******************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return  self.photoArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier:"WallFeedCell") as! WallFeedCell
        
        let photo = photoArray[indexPath.row]
        Utils.setImage(imgVw: cell.userImageView, imageStr: photo.url, placeHolderImg: kUserPlaceholder)
        cell.userImageView.layer.borderColor = UIColor.green.cgColor
        cell.userImageView.layer.borderWidth = 0.6;
        
        cell.userName.text = photo.name
        cell.userLocation.text = photo.userLocation
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
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if(!animatedIndex.contains(indexPath)){
            animatedIndex.append(indexPath)
            
            let myRect: CGRect = tableView.rectForRow(at: indexPath)
            cell.frame = CGRect(x: CGFloat(cell.frame.origin.x), y: CGFloat(cell.frame.origin.y + 568), width: CGFloat(cell.frame.size.width), height: CGFloat(cell.frame.size.height))
            
            let value = Double(indexPath.row)*0.1
            UIView.animate(withDuration: 0.5, delay:value, options: .curveEaseInOut, animations: {() -> Void in
                cell.frame = CGRect(x: CGFloat(myRect.origin.x), y: CGFloat(myRect.origin.y - 30), width: CGFloat(myRect.size.width), height: CGFloat(myRect.size.height))
            }, completion: {(_ finished: Bool) -> Void in
                UIView.animate(withDuration: 0.5, animations: {() -> Void in
                    cell.frame = myRect
                })
            })
        }
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
        imageVw.layer.borderWidth = 0.8;

       return cell;
    }
    
}
