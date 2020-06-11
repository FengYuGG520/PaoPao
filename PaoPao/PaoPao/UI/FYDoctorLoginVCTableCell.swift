//
//  FYDoctorLoginVCTableCell.swift
//  PaoPao
//
//  Created by YGBD on 2020/6/11.
//  Copyright © 2020 FengYu. All rights reserved.
//

import UIKit

class FYDoctorLoginVCTableCell: UITableViewCell {

    @IBOutlet weak var actual_name: UILabel!
    
    @IBOutlet weak var rong_status_time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 去掉 cell 选中的阴影
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
