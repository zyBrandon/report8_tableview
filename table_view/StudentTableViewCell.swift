//
//  StudentTableViewCell.swift
//  table_view
//
//  Created by 周越 on 2018/11/26.
//  Copyright © 2018年 周越. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
