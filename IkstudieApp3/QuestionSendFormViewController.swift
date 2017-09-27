//
//  QuestionSendFormViewController.swift
//  IkstudieApp3
//
//  Created by 大西智 on 2017/08/06.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit
import Firebase

class QuestionSendFormViewController: UIViewController, UITextViewDelegate,
                                      UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var QuestionTextView: UITextView!
    
    let categoryList = ["数学", "英語", "現代文", "日本史", "物理"]
    
    var questions = [Dictionary<String, Any>]()
    
    // 0926追記
    var ref:DatabaseReference!
    

    override func viewDidLoad() {
        
        //↓userDefaultsのデータを全削除する。
        // let userDefaults = UserDefaults.standard
        // userDefaults.removeObject(forKey: "questions")

        
        super.viewDidLoad()
        
        QuestionTextView.delegate = self
        
        // テキストを全消去するボタンを表示
        //QuestionTextView.clearButtonMode = .always

        // Do any additional setup after loading the view.
        
        // 0926追記インスタンスを作成
        ref = Database.database().reference()
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
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        QuestionTextView.resignFirstResponder()
        return true
    }
    
    // categoryを保存するためのコード
    var category: String? = "数学"
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        category = categoryList[row]
    }
    
    // 質問日時の取得
    func getNowClockString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月dd日"
        let now = Date()
        return formatter.string(from: now)
    }
    
//    @IBAction func sendQuestion(){
//
//        if QuestionTextView.text != nil{
//            // UserDefaults(保存)
//            // let ud = UserDefaults.standard
//            // ud.set(titleTextField.text, forKey: "title")
//            // ud.synchronize()
//        }else{
//            let  alert = UIAlertController(title: "title", message: "質問内容を記入してください", preferredStyle: .alert)
//            let  action = UIAlertAction(title: "OK!", style: .default, handler:{ (action) in})
//            alert.addAction(action)
//            self.present(alert, animated: true, completion: nil)
//        }
//
//        if QuestionTextView.text != nil {
//
//            // UserDefaultsにカテゴリと質問内容を辞書型配列に保存する
//
//            let ud = UserDefaults.standard
//            if ud.object(forKey: "questions") != nil {
//                questions = ud.object(forKey: "questions") as! [Dictionary<String, Any>]
//                // QuestionTextViewの先頭の８文字をshortTitleとして取得
//                let shortTitle = QuestionTextView.text!
//                var shortTitle2 = shortTitle.substring(to: shortTitle.index(shortTitle.startIndex,
//                                                                offsetBy: 8))
//
//
//                // UDへの保存
//                let question: Dictionary<String, Any> = ["category": category!,
//                                                         "shortTitle": shortTitle2,
//                                                         "detail": QuestionTextView.text!,
//                                                         "time": getNowClockString()]
//                questions.append(question)
//            } else {
//                let shortTitle = QuestionTextView.text!
//                var shortTitle2 = shortTitle.substring(to: shortTitle.index(shortTitle.startIndex,
//                                                                            offsetBy: 8))
//
//                let question: Dictionary<String, Any> = ["category": category!,
//                                                         "shortTitle": shortTitle2,
//                                                         "detail": QuestionTextView.text!,
//                                                         "time": getNowClockString()]
//                questions.append(question)
//            }
//
//
//            ud.set(questions, forKey: "questions")
//            ud.synchronize()
//
//            let alert = UIAlertController(title: "投稿完了！", message: "あなたの質問が投稿されました！", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK!", style: .default, handler: { (action) in
//                alert.dismiss(animated: true, completion: nil)
//                self.tabBarController?.selectedIndex = 0
//            })
//
//            alert.addAction(action)
//            self.present(alert, animated: true, completion: nil)
//
//            // 以下、後で消す
//            // questions.reverse()
//            // print(questions)
//
//        }
//    }
    

// 0926追記
    @IBAction func sendTest(_ sender: AnyObject){
        let shortTitle = QuestionTextView.text.substring(to: QuestionTextView.text.index(QuestionTextView.text.startIndex,offsetBy: 8))
        let testQuestionData = ["detail": QuestionTextView.text!,
                                "category": category!,
                                "shortTitle": shortTitle,
                                "time": getNowClockString()]
        ref.child("question").childByAutoId().setValue(testQuestionData)
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
