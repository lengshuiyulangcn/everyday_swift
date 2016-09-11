//
//  MyTableViewCell.swift
//  day9
//
//  Created by 李寧 on 2016/09/11.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    var label: UILabel!
    
    
    func setup(content: String) {
        label = UILabel()
        label.text = content
        self.addSubview(label)
        label.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}