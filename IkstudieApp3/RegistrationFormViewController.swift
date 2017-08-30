//
//  RegistrationFormViewController.swift
//  IkstudieApp3
//
//  Created by 大西智 on 2017/08/06.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class RegistrationFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    //Univ. name
    @IBOutlet weak var textField: UITextField!
    //department of a university
    @IBOutlet weak var textField2: UITextField!
        // 写真を表示するビュー
    @IBOutlet weak var imageView: UIImageView!
    
    //規定の写真から選ぶ際に使用
    @IBAction func goBack(_ segue:UIStoryboardSegue) {}
    
    /*@IBAction func goNext(_ sender:UIButton) {
        let next = storyboard!.instantiateViewController(withIdentifier: "nextView")
        self.present(next,animated: true, completion: nil)
    }*/
    
    // セグエ遷移用に追加 ↓↓↓
    @IBAction func goNextBySegue(_ sender: UIButton) {
        performSegue(withIdentifier: "nextSegue", sender: nil)
    }
    
    //
    
    
    
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
  
    
    let courseList = ["私立理系","私立文系","国立理系","国立文系","その他","未定"]
    let gradeList = ["高校３年生","高校２年生","高校１年生","高校卒業生","中学３年生以下","それ以外"]
    
    @IBOutlet weak var pickerView1: UIPickerView!
    @IBOutlet weak var pickerView2: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView1.tag = 1
        pickerView1.delegate   = self
        pickerView1.dataSource = self
        
        pickerView2.tag = 2
        pickerView2.delegate   = self
        pickerView2.dataSource = self
        
        // デフォルトの画像を表示する
        //imageView.image = UIImage(named: "default.png")
        
        // Delegate を設定
        //textField.tag = 1
        textField.delegate = self
        
        // プレースホルダー
        textField.placeholder = "テキストを入力"
        
        // 背景色
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        // 左の余白
        textField.leftViewMode = .always
        //textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        // テキストを全消去するボタンを表示
        textField.clearButtonMode = .always
        
        // 改行ボタンの種類を変更
        textField.returnKeyType = .done
        
        // No.2
        textField2.delegate = self
        textField2.placeholder = "テ"
        textField2.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField2.leftViewMode = .always
        //textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField2.clearButtonMode = .always
        textField2.returnKeyType = .done
        
    }

    // UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 表示する列数
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // アイテム表示個数を返す
        if pickerView.tag == 1 {
            return courseList.count
        } else {
            return gradeList.count
        }
    }
    
    // UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 表示する文字列を返す
        if pickerView.tag == 1 {
            return courseList[row]
        } else {
            return gradeList[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        if pickerView.tag == 1 {
            print(courseList[row])
        } else {
            print(gradeList[row])
        }
    }
    
    /* 以下は UITextFieldDelegate のメソッド */
    
    // 改行ボタンを押した時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // キーボードを隠す
        textField.resignFirstResponder()
        return true
    }
    
    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        print("Clear")
        return true
    }
    
    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Start")
        return true
    }
    
    // テキストフィールドでの編集が終わろうとするときの処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("End")
        return true
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
