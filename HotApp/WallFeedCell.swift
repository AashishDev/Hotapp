//
//  WallFeedCell.swift
//  HotApp
//
//  Created by Aashish Tyagi on 1/23/17.
//  Copyright © 2017 Aashish Tyagi. All rights reserved.
//

import UIKit

class WallFeedCell: UITableViewCell {
    
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var postHeading: UILabel!
    @IBOutlet var userLocation: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var wallPostCollectionVw: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
