//
//  FisrtViewController.swift
//  day1
//
//  Created by 李寧 on 2016/09/02.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        let label = UILabel()
        label.text = "First View"
        label.textColor = UIColor.whiteColor()
        self.view.addSubview(label)
        label.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
