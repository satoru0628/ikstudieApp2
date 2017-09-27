//
//  TestViewController.swift
//  
//
//  Created by 大西智 on 2017/09/16.
//
//

import UIKit
import Firebase

class TestViewController: UIViewController {
    
    @IBOutlet weak var TextField: UITextField!
    
    // インスタンス変数
    var DBRef:DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //インスタンスを作成
        DBRef = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: AnyObject) {
        let data = ["name": TextField.text!]
        DBRef.child("user/01").setValue(data)
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
