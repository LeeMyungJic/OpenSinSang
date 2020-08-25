//
//  ItemDataSource.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/20.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit

class ItemDataSource: NSObject, UICollectionViewDataSource {
    var Items = [Item]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
            as? CollectionViewController ?? UICollectionViewCell()
        let item = Items[indexPath.row]
        cell.updateWithImage(image: item.image)
        
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateWithImage(image: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateWithImage(image: nil)
    }
}
