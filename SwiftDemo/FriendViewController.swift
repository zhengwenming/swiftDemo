
//
//  FriendViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/16.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class FriendViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

     var friendsTable:UITableView?
     var dataArray: NSMutableArray?
    
    
    
    override func viewDidLoad() {

        
        super.viewDidLoad()

        
        self.dataArray = NSMutableArray()
        self.dataArray!.addObject("11111")
        self.dataArray!.addObject("22222")
        self.dataArray!.addObject("33333")
        self.dataArray!.addObject("44444")
        
        
        
        friendsTable = UITableView(frame: self.view.bounds, style:.Plain)
        friendsTable!.delegate = self
        friendsTable!.dataSource = self
        friendsTable!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(friendsTable!)

    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.dataArray!.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
         let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "Row #  \(self.dataArray!.objectAtIndex(indexPath.row))"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
