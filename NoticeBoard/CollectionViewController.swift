import UIKit



//필요한 프로토콜 상속 받기

class CollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var CollectionViewMain: UICollectionView!
    
    var items = [Item]()
    static var receivedCategoey = ""
    @IBOutlet weak var CategoryTitle: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        CategoryTitle.text = CollectionViewController.receivedCategoey
        
        if CollectionViewController.receivedCategoey == "전체보기" {
            items = ItemsSetting.Items
        }
        else {
            for temp in ItemsSetting.Items {
                if temp.category == CollectionViewController.receivedCategoey {
                    items.append(temp)
                }
            }
        }
    }
    
    
    @IBAction func initRefresh() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateUI(refresh: )), for: .valueChanged)
        refresh.attributedTitle = NSAttributedString(string: "새로고침")
        
        if #available(iOS 10.0, *) {
            CollectionViewMain.refreshControl = refresh
        }
        else {
            CollectionViewMain.addSubview(refresh)
        }
    }
    
    @objc func updateUI(refresh: UIRefreshControl) {
        refresh.endRefreshing()
        CollectionViewMain.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddCell"{
            let secondVC = segue.destination as! ItemCreateViewController
        }
        
        guard segue.identifier == "CellClick" else{
            assertionFailure("The identifier for segue object is not 'ShowPhoto'.")
            return
        }
        guard let selectedIndexPath = CollectionViewMain.indexPathsForSelectedItems?.first else{
            assertionFailure("The first element is nil.")
            return
        }
        guard let destinationViewController = segue.destination as? ItemDetailViewController else {
            print("Failed downcasting destination to PhotoInfoViewController.")
            return
        }
        
        destinationViewController.receievedImage = items[selectedIndexPath.row].image!
        destinationViewController.itemTitle = items[selectedIndexPath.row].title
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        //이미지 카운터 하는 함수

        return items.count

    }
    //셀 구성하기
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        
        cell.image.image = resize(getImage: items[indexPath.row].image!)
        //cell.image.image = items[indexPath.row].image!
        cell.label.text = items[indexPath.row].title
        
        // 셀 디자인
        //cell.layer.borderColor = UIColor.black.cgColor
        // 테두리 두께
        //cell.layer.borderWidth = 1
        // 모서리 둥글게
        //cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "ItemDetailViewController") as! ItemDetailViewController
        
        controller.itemTitle = items[indexPath.row].title
    }
    

    func resize(getImage:UIImage) -> UIImage {
        
        let wif = CollectionViewMain.layer.borderWidth
        var new_image : UIImage!
        let size = CGSize(width:  120  , height: 120 )

        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)

        getImage.draw(in: rect)

        new_image = UIGraphicsGetImageFromCurrentImageContext()!

        UIGraphicsEndImageContext()

        return new_image
    }
    
}


