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
    var receievedImage: UIImage?
    var itemTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.imageMain.image = receievedImage
        
        if let str = itemTitle {
            self.labelMain.text = str
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
