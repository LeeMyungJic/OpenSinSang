//
//  ViewController.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/11.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewMain: UITableView!
    var itemdata :Array<Dictionary<String, Any>>?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        cell.labelText.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "ItemDetailViewController") as! ItemDetailViewController
       // controller.title = "\(indexPath.row)"
//        if let item = itemdata {
//            let row = item[indexPath.row]
//            if let r = row as? Dictionary<String, Any> {
//
//                controller.title = "\(indexPath.row)"
//            }
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "ItemDetailViewController" == id {
            if let controller = segue.destination as? ItemDetailViewController {
                if let item = itemdata {
                    if let indexPath = TableViewMain.indexPathForSelectedRow {
                        let row = item[indexPath.row]

                        if let r = row as? Dictionary<String, Any> {
                    
                            controller.title = "\(indexPath.row)"
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
}

