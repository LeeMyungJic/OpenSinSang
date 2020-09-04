//
//  Item.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/20.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class Item {
    
    var image: UIImage?
    let title: String?
    let category: String?
    var rating: Int?
    init(title: String, image: UIImage, category: String, rating: Int) {
        
        self.image = image
        self.title = title
        self.category = category
        self.rating = rating
        
    }
}
