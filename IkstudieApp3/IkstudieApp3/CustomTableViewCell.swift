//
//  CustomTableViewCell.swift
//  IkstudieApp3
//
//  Created by 増田大海 on 2017/08/25.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTitleLabel: UILabel!
    @IBOutlet weak var myDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /// 画像・タイトル・説明文を設定するメソッド
    func setCell(imageName: String, titleText: String, descriptionText: String) {
        myImageView.image = UIImage(named: imageName)
        myTitleLabel.text = titleText
        myDescriptionLabel.text = descriptionText
        
        //表示可能最大行数を指定
        myDescriptionLabel.numberOfLines = 0
        //単語の途中で改行されないようにする
        //myDescriptionLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
    }
}
