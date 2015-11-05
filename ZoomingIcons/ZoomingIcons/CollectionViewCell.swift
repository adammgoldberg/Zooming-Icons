//
//  CollectionViewCell.swift
//  ZoomingIcons
//
//  Created by Adam Goldberg on 2015-11-05.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var viewColor: UIView!
    
    var socialItem: SocialItem?
    

    override func layoutSubviews() {
        self.viewColor.layer.cornerRadius = 40
        self.viewColor.layer.masksToBounds = true
    
    }
    
    
    
    init(frame: CGRect, social: SocialItem) {
        super.init(frame: frame)
        self.socialItem = social
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}
