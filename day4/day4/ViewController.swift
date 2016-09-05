//
//  ViewController.swift
//  day4
//
//  Created by 李寧 on 2016/09/05.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = Tab1ViewController()
        let image1 = UIImage.fontAwesomeIconWithName(.Github, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: image1, selectedImage: UIImage(named: "selectedImage.png"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = Tab2ViewController()
        let image2 = UIImage.fontAwesomeIconWithName(.Facebook, textColor:UIColor.blueColor(), size: CGSizeMake(30, 30))
        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: image2, selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        
        self.viewControllers = [tabOne, tabTwo]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}