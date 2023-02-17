//
//  CollectionViewCell.swift
//  swift_6_task
//
//  Created by Omar on 05/02/2023.
//

import UIKit
import Kingfisher
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var my_label: UILabel!
    
    @IBOutlet weak var my_img: UIImageView!
    
    
    func configureCell(movie: Item){
                self.layer.cornerRadius = 15
                my_label.text = movie.title
                let url = URL(string: movie.image!)
                //let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
//                my_img.kf.indicatorType = .activity
        my_img.kf.indicatorType = .activity
                my_img.kf.setImage(
                    with: url,
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage
                    ])
            }
}
