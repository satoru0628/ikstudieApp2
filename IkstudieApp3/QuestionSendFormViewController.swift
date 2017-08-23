//
//  QuestionSendFormViewController.swift
//  IkstudieApp3
//
//  Created by 大西智 on 2017/08/06.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class QuestionSendFormViewController: UIViewController, UITextFieldDelegate,
                                      UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var QuestionTextField: UITextField!
    
    let categoryList = ["数学", "英語", "現代文", "日本史", "物理"]
    
    var questions = [Dictionary<String, Any>]()

    override func viewDidLoad() {
        
        //↓userDefaultsのデータを全削除する。
        // let userDefaults = UserDefaults.standard
        // userDefaults.removeObject(forKey: "questions")

        
        super.viewDidLoad()
        
        QuestionTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //PickerViewに表示する列数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //PickerViewに表示する行数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryList.count
    }
    
    //Picker Viewに表示する値を返す
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryList[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        QuestionTextField.resignFirstResponder()
        return true
    }
    
    // categoryを保存するためのコード
    var category: String?
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        category = categoryList[row]
    }
    
    @IBAction func sendQuestion(){
        
        if QuestionTextField.text != nil{
            // UserDefaults(保存)
            // let ud = UserDefaults.standard
            // ud.set(titleTextField.text, forKey: "title")
            // ud.synchronize()
        }else{
            let  alert = UIAlertController(title: "title", message: "質問内容を記入してください", preferredStyle: .alert)
            let  action = UIAlertAction(title: "OK!", style: .default, handler:{ (action) in})
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        if QuestionTextField.text != nil {
            
            // UserDefaultsにカテゴリと質問内容を辞書型配列に保存する
            
            let ud = UserDefaults.standard
            if ud.object(forKey: "questions") != nil {
                questions = ud.object(forKey: "questions") as! [Dictionary<String, Any>]
                // QuestionTextFieldの先頭の８文字をshortTitleとして取得
                let shortTitle = QuestionTextField.text!
                var shortTitle2 = shortTitle.substring(to: shortTitle.index(shortTitle.startIndex,
                                                                offsetBy: 8))
                
                //↓カテゴリが保存できるようになっていないので修正
                let question: Dictionary<String, Any> = ["category": category!,
                                                         "shortTitle": shortTitle2,
                                                         "detail": QuestionTextField.text!]
                questions.append(question)
            } else {
                let shortTitle = QuestionTextField.text!
                var shortTitle2 = shortTitle.substring(to: shortTitle.index(shortTitle.startIndex,
                                                                            offsetBy: 8))
                
                //↓カテゴリが保存できるようになっていないので修正
                let question: Dictionary<String, Any> = ["category": category!,
                                                         "shortTitle": shortTitle2,
                                                         "detail": QuestionTextField.text!]
                questions.append(question)
            }
            
            ud.set(questions, forKey: "questions")
            ud.synchronize()
            
            let alert = UIAlertController(title: "投稿完了！", message: "あなたの質問が投稿されました！", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK!", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
                self.tabBarController?.selectedIndex = 0
            })
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
            // 以下、後で消す
            questions.reverse()
            print(questions)
            
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
