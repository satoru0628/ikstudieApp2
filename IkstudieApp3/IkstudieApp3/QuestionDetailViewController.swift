//
//  QuestionDetailViewController.swift
//  IkstudieApp3
//
//  Created by 大西智 on 2017/08/09.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class QuestionDetailViewController: UIViewController {
    
    // questionの情報を入れておくDictionary変数
    var question: Dictionary<String, Any?>!
    
    // 質問のtextView
    @IBOutlet weak var questionTextView: UITextView!
    
    // カテゴリのLabel
    @IBOutlet var categoryLabel: UILabel!
    
    // 質問者名のLabel
    @IBOutlet var questionarNameLabel: UILabel!
    
    // 投稿時間のLabel
    @IBOutlet var timeLabel: UILabel!
    
    // 質問の閲覧数のLabel
    @IBOutlet var viewCounterLabel: UILabel!
    
    // 質問への回答数のLabel
    @IBOutlet var answerCounterLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // questionTextキーで取り出した値をString型にダウンキャストして質問内容を表示
        questionTextView.text = question["detail"] as? String
        // categoryキーで取り出した値をString型にダウンキャストしてカテゴリを表示
        categoryLabel.text = question["category"] as? String
        // timeキーで取り出した値をString型にダウンキャストして投稿時間を表示
        timeLabel.text = question["time"] as? String

        

        
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
