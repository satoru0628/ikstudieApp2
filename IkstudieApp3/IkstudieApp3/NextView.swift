//
//  NextView.swift
//  IkstudieApp3
//
//  Created by 増田大海 on 2017/08/24.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class NextView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    /// 画像のファイル名
    let imageNames = ["cat1.jpg", "cat2.jpg", "dog1.jpg", "dog2.jpg"]
    
    /// 画像のタイトル
    let imageTitles = ["ネコ1", "ネコ2", "イヌ1", "イヌ2"]
    
    /// 画像の説明
    let imageDescriptions = [
        "ボックスから顔だけだして下を見ているオス猫",
        "寝ころびながらじゃれる猫",
        "散歩中のポメラニアン",
        "お散歩中のワンちゃん"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    /// セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomTableViewCell
        
        // セルに値を設定
        cell.setCell(imageName: imageNames[indexPath.row], titleText: imageTitles[indexPath.row], descriptionText: imageDescriptions[indexPath.row])
        
        return cell
    }
    
    /// セルが選択された時に呼ばれるデリゲートメソッド　（（　実験項目　））
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("セル番号：\(indexPath.row) セルの内容：\(imageTitles[indexPath.row])")
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
