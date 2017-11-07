//
//  MoviesListViewCell.swift
//  ytsMoviesApp
//
//  Created by DCMac01 on 11/6/17.
//  Copyright © 2017 DCMac01. All rights reserved.
//

import UIKit

class MoviesListViewCell: UICollectionViewCell {

    
    @IBOutlet weak var movieCover: UIImageView!
    @IBOutlet weak var movieQuality: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
