//
//  RespondentsEditMypageViewController.swift
//  IkstudieApp3
//
//  Created by 大西智 on 2017/08/07.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class RespondentsEditMypageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // 写真を表示するビュー
    @IBOutlet weak var imageView: UIImageView!
    
    // カメラロールから写真を選択する処理
    @IBAction func choosePicture() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }
        
    // 写真を選んだ後に呼ばれる処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 選択した写真を取得する
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        // ビューに表示する
        self.imageView.image = image
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // デフォルトの画像を表示する
        imageView.image = UIImage(named: "default.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
