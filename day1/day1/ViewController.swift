//
//  ViewController.swift
//  day1
//
//  Created by 李寧 on 2016/09/01.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit
class PageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .Forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
    func getFirst() -> FirstViewController {
        return FirstViewController()
    }
    
    func getSecond() -> SecondViewController {
        return SecondViewController()
    }
    
    func getThird() -> ThirdViewController {
        return ThirdViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(ThirdViewController) {
            // 3 -> 2
            return getSecond()
        } else if viewController.isKindOfClass(SecondViewController) {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(FirstViewController) {
            // 1 -> 2
            return getSecond()
        } else if viewController.isKindOfClass(SecondViewController) {
            // 2 -> 3
            return getThird()
        } else {
            // 3 -> end of the road
            return nil
        }
    }
}
