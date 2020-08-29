//
//  LoginViewController.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/28.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var IdField: UITextField!
    @IBOutlet weak var JoinButton: UIButton!
    @IBOutlet weak var PassButton: UITextField!
    var IdStr: String = "null"
    override func viewDidLoad() {
        super.viewDidLoad()
        IdField.attributedPlaceholder = NSAttributedString(string: "ID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        PassButton.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        InfoViewController.name = IdField.text!
    }

}
