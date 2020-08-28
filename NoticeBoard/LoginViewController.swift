//
//  LoginViewController.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/28.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var IdField: UITextField!
    var IdStr: String = "null"
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func LoginAction(_ sender: Any) {
        InfoViewController.name = IdField.text!
    }

}
