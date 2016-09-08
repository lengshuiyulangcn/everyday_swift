//
//  NewsTableViewCell.swift
//  day7
//
//  Created by 李寧 on 2016/09/08.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit
import SnapKit

class NewsTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(title: String){
        let label = UILabel()
        label.lineBreakMode = NSLineBreakMode.ByCharWrapping
        label.numberOfLines = 2
        label.text = title
        self.addSubview(label)
        label.snp_makeConstraints { (make) in
            make.leftMargin.equalTo(5)
            make.rightMargin.equalTo(5)
        }

    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
