//
//  HomeViewController.swift
//  IkstudieApp3
//
//  Created by 大西智 on 2017/08/06.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var questions = [Dictionary<String, Any>]()
    
    // StoryboardTableView
    @IBOutlet var questionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TableViewDataSourceの処理をこのViewControllerで書きますよ、ということを指定
        questionTableView.dataSource = self
        
        // TableViewDelegateの処理をこのViewControllerで書きますよ、ということを指定
        questionTableView.delegate = self
        
        // UserDefaultsに入っているデータの取得
        // let ud = UserDefaults.standard
        // questions = ud.object(forKey: "questions") as! [Dictionary<String, Any>]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // 課題２：userDefaultsに保存されている情報を取得＆取り出し
        let ud = UserDefaults.standard
        if ud.object(forKey: "questions") != nil {
            questions = ud.object(forKey: "questions") as! [Dictionary<String, Any>]
            questionTableView.reloadData()
        } else {
            questions = [Dictionary<String, Any>]()
            questionTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 表示させるセルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // questions配列の数だけセルを作る
        return questions.count
    }
    
    // 表示させるセルの中身を指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 先ずはStoryboardでidを指定した再利用可能なセルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell")!
        
        // セルにquestions配列の中身を表示
        cell.textLabel?.text = questions[indexPath.row]["shortTitle"] as! String
        
        return cell
    }
    
    // TableViewのCellが押されたとき(押される動作の直後)に呼ばれるDelegateメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択状態を解除
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 画面遷移時に呼ばれるViewControllerが標準で持っている機能
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次の画面を取得して、DetailViewControllerに変換
        let detailViewController = segue.destination as! QuestionDetailViewController
        
        // 選択されているセルのindexPathを取得
        let selectedIndexPath = questionTableView.indexPathForSelectedRow
        
        // question配列の選択されたセル番目の情報を取得してselectedQuestion変数に代入
        let selectedQuestion = questions[selectedIndexPath!.row]
        
        // QuestionDetailViewControllerのquestion変数に今選ばれているquestionを代入
        // QuestionDetailViewController.question = selectedQuestion
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
