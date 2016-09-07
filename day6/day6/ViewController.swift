//
//  ViewController.swift
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

class ViewController: UIViewController {
    let oauthswiftFacebook = OAuth2Swift(
        consumerKey:    "MY APP KEY",
        consumerSecret: "MY APP SECRET",
        authorizeUrl:   "https://www.facebook.com/dialog/oauth",
        accessTokenUrl: "https://graph.facebook.com/oauth/access_token",
        responseType:   "code"
    )
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        if((Defaults[.oauth_token]) != nil){
            let userVC = UserViewController()
            self.presentViewController(userVC, animated:true, completion:nil)
        }
        else{
            showLogin()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLogin(){
        let button = UIButton();
        button.titleLabel?.font = UIFont.fontAwesomeOfSize(30)
        button.setTitle(String.fontAwesomeIconWithName(.Facebook)+"  facebook login", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.frame = CGRectMake(15, -50, 200, 100)
        
        self.view.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        button.addTarget(self, action: #selector(ViewController.facebookLogin(_:)), forControlEvents: .TouchUpInside)

    }
    
       
    func facebookLogin(sender: UIButton!) {
        let state: String = generateStateWithLength(20) as String
        oauthswiftFacebook.authorizeWithCallbackURL(
            NSURL(string: "http://localhost:4567/callback/facebook")!,
            scope: "public_profile", state: state,
            success: { credential, response, parameters in
                Defaults[.oauth_token] = credential.oauth_token
                let userVC = UserViewController()
                self.presentViewController(userVC, animated:true, completion:nil)

                self.testFacebook(self.oauthswiftFacebook)
            },
            failure: { error in
                print(error.localizedDescription)
            }
        )
    }
    func testFacebook(oauthswift: OAuth2Swift) {
        oauthswiftFacebook.client.get("https://graph.facebook.com/me?",
                                      success: {
                                        data, response in
                                        let dataString = NSString(data: data, encoding: NSUTF8StringEncoding)
                                        print(dataString)
            }, failure: { error in
                print(error)
        })
    }


}

extension DefaultsKeys {
    static let oauth_token = DefaultsKey<String?>("oauth_token")
}

