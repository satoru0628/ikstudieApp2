//
//  MypageViewController.swift
//  IkstudieApp3
//
//  Created by 大西智 on 2017/08/06.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {

    var information: Dictionary<String, Any?>!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var univLabel: UILabel!

    
    
    // セグエ遷移用に追加 ↓↓↓
    @IBAction func profileSet(_ sender: UIButton) {
        performSegue(withIdentifier: "nextSegue2", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //userDefaultsに保存されている情報を取得＆取り出し
        let ud = UserDefaults.standard
        if ud.object(forKey: "Informations") == nil/*if information.isEmpty*/ {
            courseLabel.text = "未登録"
            univLabel.text = "未登録"
        }else{
            courseLabel.text = information["course"] as? String
            univLabel.text = information["univ"] as? String
            //ud中身表示
            
        }
        // Do any additional setup after loading the view.
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
