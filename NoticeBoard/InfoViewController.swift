//
//  InfoViewController.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/25.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    
    static var name: String = ""
    @IBOutlet weak var NameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if InfoViewController.name == "" {
            NameLabel.text = "Null"
        }
        else {
            NameLabel.text = InfoViewController.name
        }
        
    }
}
