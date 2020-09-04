//
//  ItemDetailViewController.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/11.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var labelMain: UILabel!
    
    var imageUrl: String?
    var index: Int!
    var receievedImage: UIImage?
    @IBOutlet weak var rating: UILabel!
    var itemTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.imageMain.image = receievedImage
        
        if let str = itemTitle {
            self.labelMain.text = str
        }
        rating.text = "\(index!)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusRating(_ sender: Any) {
        ItemsSetting.Items[index].rating = ItemsSetting.Items[index].rating! + 1
        rating.text = "\(ItemsSetting.Items[index].rating!)"
    }
}
