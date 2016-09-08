//
//  ViewController.swift
//  day7
//
//  Created by 李寧 on 2016/09/08.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var url = NSURL(string: "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=https://forum.qilian.jp/topics/feed")
    
    var passages: JSON! {
        didSet {
            self.tableView.reloadData()
        }
    }
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        self.navigationItem.title = "MainView"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        Alamofire.request(.GET, url!).responseJSON { response in
            if let values = response.result.value {
                self.passages = JSON(values)["responseData"]["feed"]["entries"]
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let passages = self.passages  {
           return passages.count
         }
        else {
        return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->  UITableViewCell {
        let cell = NewsTableViewCell()
        cell.setup(self.passages[indexPath.row]["title"].string!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let subView = WebViewController()
        subView.setup(self.passages[indexPath.row]["link"].string!)
        self.navigationController?.pushViewController(subView as UIViewController, animated: true)
    }


}

