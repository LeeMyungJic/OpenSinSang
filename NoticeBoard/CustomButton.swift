//
//  CustomButton.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/29.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    static let buttonColor = #colorLiteral(red: 0.919944346, green: 0.5834438205, blue: 0.7190411687, alpha: 1)
    
    static func setButton(button: UIButton) -> UIButton{
        button.layer.borderColor = buttonColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        
        return button
        
    }
}
