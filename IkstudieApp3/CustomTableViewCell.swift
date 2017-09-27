//
//  CustomTableViewCell.swift
//  IkstudieApp3
//
//  Created by 大西智 on 2017/09/03.
//  Copyright © 2017年 ikstudie. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var shortTitleTextView: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
