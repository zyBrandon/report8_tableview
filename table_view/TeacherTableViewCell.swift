//
//  TeacherTableViewCell.swift
//  table_view
//
//  Created by 周越 on 2018/11/27.
//  Copyright © 2018年 周越. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
