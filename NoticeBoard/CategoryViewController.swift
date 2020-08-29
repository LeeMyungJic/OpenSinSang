//
//  CategoryViewController.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/21.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var category = [String]()

    @IBOutlet weak var BrandTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.purple
        self.navigationController?.navigationBar.topItem?.title = ""

        var items:ItemsSetting = ItemsSetting()
       
        category = ItemsSetting.Categories
        
        BrandTable.delegate = self
        BrandTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    // 데이터가 무엇인지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = BrandTable.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! categoryCell
        
        cell.BrandName.text = category[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(identifier: "CollectionViewController") as! CollectionViewController
        CollectionViewController.receivedCategoey = category[indexPath.row]
        
    }
}
