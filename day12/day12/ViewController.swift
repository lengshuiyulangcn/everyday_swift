//
//  ViewController.swift
//  day12
//
//  Created by 李寧 on 2016/09/15.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sampleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sampleView = UIView(frame: CGRectMake(0, 0, 100, 100))
        sampleView.backgroundColor = UIColor.redColor()
        sampleView.center = self.view.center;
        self.view.addSubview(sampleView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1.0) { () -> Void in
            self.sampleView.transform = CGAffineTransformMakeScale(1.5, 1.5)
        }
    }
    
}

