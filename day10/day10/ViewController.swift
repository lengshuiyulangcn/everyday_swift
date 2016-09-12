//
//  ViewController.swift
//  day10
//
//  Created by 李寧 on 2016/09/12.
//  Copyright © 2016年 gyorou. All rights reserved.
//


import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    var texts = ["one", "two", "three"];
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
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ViewController.append), forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        }
    
    func append() {
        self.texts.append("new element")
        print(texts)
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
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
    
    
}