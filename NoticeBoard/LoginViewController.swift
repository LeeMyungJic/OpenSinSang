//
//  LoginViewController.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/28.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let buttonColor = #colorLiteral(red: 0.919944346, green: 0.5834438205, blue: 0.7190411687, alpha: 1)
   
    @IBOutlet weak var IdField: UITextField!
    @IBOutlet weak var PassField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var JoinButton: UIButton!
    var IdStr: String = "null"
    override func viewDidLoad() {
        super.viewDidLoad()
        IdField.attributedPlaceholder = NSAttributedString(string: "ID", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        PassField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
   
        LoginButton = CustomButton.setButton(button: LoginButton)
        JoinButton = CustomButton.setButton(button: JoinButton)
        
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        InfoViewController.name = IdField.text!
    }
    
    // 터치하여 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)

    }

}
