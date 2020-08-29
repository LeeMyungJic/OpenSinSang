//
//  CustomButton.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/29.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0;
        //self.backgroundColor = UIColor(red: 255/255, green: 132/255, blue: 102/255, alpha: 1)
        self.backgroundColor = UIColor.clear
        self.tintColor = UIColor.white
        
    }


}
