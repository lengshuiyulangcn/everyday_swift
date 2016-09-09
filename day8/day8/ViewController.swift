//
//  ViewController.swift
//  day8
//
//  Created by 李寧 on 2016/09/09.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit
import SnapKit
import FontAwesome_swift

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        let takeButton = UIButton()
        takeButton.titleLabel?.font = UIFont.fontAwesomeOfSize(30)
        takeButton.setTitle("启动相机", forState: .Normal)
        takeButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        takeButton.frame = CGRectMake(15, -50, 200, 100)
        takeButton.addTarget(self, action: #selector(ViewController.cameraStart(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(takeButton)
        takeButton.snp_makeConstraints { (make) in
           // make.center.equalTo(self.view)
            make.bottom.equalTo(self.view.snp_bottom).offset(-50)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cameraStart(sender : AnyObject) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.Camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            showAlert("", message: "Error of the camera function.")
        }
    }
    func imagePickerController(imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let imageView = UIImageView()
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = pickedImage
        }
        self.view.addSubview(imageView)
        
        //閉じる処理
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 書き込み完了結果の受け取り
    func image(image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutablePointer<Void>) {
        if error != nil {
            showAlert("", message: "Failed to save the picture.")
        } else {
            showAlert("", message: "The picture was saved.")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertView = UIAlertView()
        alertView.title = title
        alertView.message = message
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }



}

