//
//  SocialItem.swift
//  ZoomingIcons
//
//  Created by Adam Goldberg on 2015-11-05.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

class SocialItem: NSObject {

    var image : UIImage
    var colour : UIColor
    var name : String
    var summary : String
    
    init(image: UIImage, colour: UIColor, name: String, summary: String) {
        self.image = image
        self.colour = colour
        self.name = name
        self.summary = summary
        super.init()

    }

    


    
    
}
