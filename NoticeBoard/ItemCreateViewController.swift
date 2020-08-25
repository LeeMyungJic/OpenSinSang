//
//  ItemCreateViewController.swift
//  NoticeBoard
//
//  Created by 이명직 on 2020/08/11.
//  Copyright © 2020 LMJ. All rights reserved.
//

import UIKit
import MobileCoreServices

class ItemCreateViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var getImageButton: UIButton!
    @IBOutlet weak var brandName: UITextField!
    @IBOutlet weak var ProductName: UITextField!
    
    let category = ["Apple", "Samsung", "LG"]
    
    var flagImageSave = false
    let imagePicker = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imagePicker.delegate = self
        self.getImageButton.layer.borderColor = UIColor.black.cgColor
        self.getImageButton.layer.cornerRadius = 8
        
        createPickerView()
        dismissPickerView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addImage(_ sender: Any)
    
    {
        
        let alert =  UIAlertController(title: "이미지 추가하기", message: "선택하세요", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()

        }


        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in

        self.openCamera()

        }


        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)


        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)

        present(alert, animated: true, completion: nil)
        
    }
    
    func openLibrary(){

      if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
          flagImageSave = false
          
          imagePicker.delegate = self
          imagePicker.sourceType = .photoLibrary // 이미지 피커의 소스 타입을 PotoLibrary로 설정
          imagePicker.mediaTypes = [kUTTypeImage as String]
          imagePicker.allowsEditing = true // 편집을 허용
          
          present(imagePicker, animated: true, completion: nil)
      } else {
          myAlert("Photo album inaccessable", message: "Application cannot access the photo albm.")
      }

    }

    func openCamera(){
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true // 사진 저장 플래그를 true로 설정
            
            imagePicker.delegate = self // 이미지 피커의 델리케이트를 self로 설정
            imagePicker.sourceType = .camera // 이미지 피커의 소스 타입을 Camera로 설정
            imagePicker.mediaTypes = [kUTTypeImage as String] // 미디어 타입을 kUTTypeImage로 설정
            imagePicker.allowsEditing = false // 편집을 허용하지 않음
            
            // 뷰 컨트롤러를 imagePicker로 대체
            present(imagePicker, animated: true, completion: nil)
        } else {
            // 카메라를 사용할 수 없을 때 경고 창 출력
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    // 사진 촬영이나 선택이 끝났을 때 호출되는 델리게이트 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 미디어 종류 확인
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        // 미디어가 사진이면
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            // 사진을 가져옴
            let captureImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            if flagImageSave { // flagImageSave가 true일 때
                // 사진을 포토 라이브러리에 저장
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            imageView.image = captureImage
        }
        // 현재의 뷰(이미지 피커) 제거
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // 사진 촬영이나 선택을 취소했을 때 호출되는 델리게이트 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 현재의 뷰(이미지 피커) 제거
        self.dismiss(animated: true, completion: nil)
    }
    
    func myAlert(_ title: String,message: String) {
        // Alert show
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addItem(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
       
        if let str = ProductName.text {
            if let tempImage = imageView.image {
                if let category = brandName.text {
                    //controller.items.append(Item(title: str, image: tempImage))
                    ItemsSetting.Items.append(Item(title: str, image: tempImage, category: category))
                    
                    ProductName.text = ""
                    imageView.image = nil
                    brandName.text = ""
                    
                    guard let moveFirst = tabBarController?.viewControllers?[0] else {
                        return
                    }
                    tabBarController?.selectedViewController = moveFirst
                }
            }
            
        }
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 1
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count

    }


    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return category[row]
    }


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        brandName.text = category[row]
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        brandName.inputView = pickerView
    }
    
    func dismissPickerView() {
           let toolBar = UIToolbar()
            toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: nil )
            toolBar.setItems([button], animated: true)
            toolBar.isUserInteractionEnabled = true
            brandName.inputAccessoryView = toolBar
    }
    
}





