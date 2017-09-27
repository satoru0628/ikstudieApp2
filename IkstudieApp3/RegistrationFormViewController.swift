//
//  RegistrationFormViewController.swift
//  IkstudieApp3
//
//  Created by 大西智 on 2017/08/06.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class RegistrationFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    //生徒情報保存データ
    var informations = [Dictionary<String, Any>]()
    //var information: Dictionary<String, Any?>!

    
    //nickname
    @IBOutlet weak var nickNameTextField: UITextField!
    //Univ. name
    @IBOutlet weak var univTextField: UITextField!
    //department of a university
    @IBOutlet weak var departTextField: UITextField!
    
    
        // 写真を表示するビュー
    @IBOutlet weak var imageView: UIImageView!
    
    //規定の写真から選択後のBackボタン時に使用
    @IBAction func goBack(_ segue:UIStoryboardSegue) {}
    
    /*@IBAction func goNext(_ sender:UIButton) {
        let next = storyboard!.instantiateViewController(withIdentifier: "nextView")
        self.present(next,animated: true, completion: nil)
    }*/
    
    // セグエ遷移用に追加,「規定の写真から選択」ボタン
    @IBAction func goNextBySegue(_ sender: UIButton) {
        performSegue(withIdentifier: "nextSegue", sender: nil)
    }
    
    
    
    
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
    
    @IBOutlet weak var coursePickerView: UIPickerView!
    @IBOutlet weak var gradePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coursePickerView.tag = 1
        coursePickerView.delegate   = self
        coursePickerView.dataSource = self
        
        gradePickerView.tag = 2
        gradePickerView.delegate   = self
        gradePickerView.dataSource = self
        
        // デフォルトの画像を表示する
        //imageView.image = UIImage(named: "default.png")
        
        // Delegate を設定
        // 大学名入力欄について
        univTextField.delegate = self
        
        // プレースホルダー
        univTextField.placeholder = "○○大学"
        
        // 背景色
        univTextField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        // 左の余白
        univTextField.leftViewMode = .always
        //textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        // テキストを全消去するボタンを表示
        univTextField.clearButtonMode = .always
        
        // 改行ボタンの種類を変更
        univTextField.returnKeyType = .done
        
        // 学部名入力欄について
        departTextField.delegate = self
        departTextField.placeholder = "○○学部"
        departTextField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        departTextField.leftViewMode = .always
        //textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        departTextField.clearButtonMode = .always
        departTextField.returnKeyType = .done
        
        //ニックネーム入力欄について
        nickNameTextField.delegate = self
        nickNameTextField.leftViewMode = .always
        nickNameTextField.clearButtonMode = .always
        nickNameTextField.returnKeyType = .done
        
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
    
    
    /* 以下は UITextFieldDelegate のメソッド */
    
    // 改行ボタンを押した時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // キーボードを隠す
        nickNameTextField.resignFirstResponder()
        univTextField.resignFirstResponder()
        departTextField.resignFirstResponder()
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
    
    
        // categoryを保存するためのコード
    var courseCategory: String?
    var gradeCategory: String?
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        courseCategory = courseList[row]
        gradeCategory = gradeList[row]
        
        if pickerView.tag == 1 {
            print(courseList[row])
        } else {
            print(gradeList[row])
        }
    }
    
    
    //以下ライオンの生徒情報保存コード改造版
    //sendQuestion → sendInfo
    @IBAction func sendInfo() {
        
        //ニックネーム入力時の対処法
        if nickNameTextField.text == ""{
            
        //}else{
            let  alert = UIAlertController(title: "nickname", message: "ニックネームを記入してください", preferredStyle: .alert)
            let  action = UIAlertAction(title: "OK!", style: .default, handler:{ (action) in})
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        //大学名入力時の対処法
        else if univTextField.text == ""{
            
        //}else{
            let  alert = UIAlertController(title: "univ", message: "大学名を記入してください", preferredStyle: .alert)
            let  action = UIAlertAction(title: "OK!", style: .default, handler:{ (action) in})
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
 
        
        //両方記入されていた場合の対処法
        else /*if nickNameTextField.text != nil && univTextField.text != nil*/ {
            
            // UserDefaultsにタイトルと質問内容を辞書型配列に保存する
            let ud = UserDefaults.standard
            if ud.object(forKey: "Informations") != nil {
                print("C")
                //informations = ud.object(forKey: "informations") as! [Dictionary<String, Any>]
                let information: Dictionary<String, Any> = ["nickname": nickNameTextField.text!, "course": courseCategory!, "grade": gradeCategory!, "univ": univTextField.text!, "depart": departTextField.text!]
                informations.append(information)
            } else {
                informations = ud.object(forKey: "informations") as! [Dictionary<String, Any>]
                print("D")
                let information: Dictionary<String, Any> = ["nickname": nickNameTextField.text!, "course": courseCategory ?? "1未記入", "grade": gradeCategory ?? "2未記入", "univ": univTextField.text!, "depart": departTextField.text!]
                informations.append(information)
            }
            
            print("w")
            ud.set(informations, forKey: "informations")
            ud.synchronize()
            
            
            let alert = UIAlertController(title: "登録完了！", message: "あなたの情報が登録されました！", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK!", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
                self.tabBarController?.selectedIndex = 0
            })
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
            // 以下、後で消す
            informations.reverse()
            print(informations)
            
        }
        
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
