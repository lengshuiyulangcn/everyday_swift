//
//  UserViewController.swift
//  day6
//
//  Created by 李寧 on 2016/09/07.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit
import SnapKit
import FontAwesome_swift
import OAuthSwift
import SwiftyUserDefaults

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        if((Defaults[.oauth_token]) == nil){
            let LoginVC = ViewController()
            self.presentViewController(LoginVC, animated:true, completion:nil)
        }
        else{
            showLogOut()
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func showLogOut(){
        let button = UIButton();
        button.titleLabel?.font = UIFont.fontAwesomeOfSize(30)
        button.setTitle("Logout", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.frame = CGRectMake(15, -50, 200, 100)
        
        self.view.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        button.addTarget(self, action: #selector(UserViewController.facebookLogout(_:)), forControlEvents: .TouchUpInside)
        
    }
    
    func facebookLogout(sender: UIButton!){
        Defaults[.oauth_token] = nil
        let LoginVC = ViewController()
        self.presentViewController(LoginVC, animated:true, completion:nil)
        
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
