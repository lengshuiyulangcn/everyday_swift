//
//  ViewController.swift
//  day9
//
//  Created by 李寧 on 2016/09/11.
//  Copyright © 2016年 gyorou. All rights reserved.
//

import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var tableView: UITableView!
    
    var texts: [String] = ["one", "two", "tree"] {
        didSet{
            sleep(2)
            self.tableView.reloadData()
            dismissViewControllerAnimated(false, completion: nil)
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->  UITableViewCell {
        let cell = MyTableViewCell()
        cell.setup(texts[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let lastElement = texts.count - 1
        if indexPath.row == lastElement {
            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .Alert)
            
            alert.view.tintColor = UIColor.blackColor()
            let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(10, 5, 50, 50)) as UIActivityIndicatorView
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            loadingIndicator.startAnimating();
            
            alert.view.addSubview(loadingIndicator)
            presentViewController(alert, animated: true, completion: nil)

            texts.append("\(texts.count)")
            // handle your logic here to get more items, add it to dataSource and reload tableview
        }
    }
    
    
}
