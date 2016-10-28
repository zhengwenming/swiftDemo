//
//  BaseViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/16.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    
    func showAddressBook(){
        print("showAddressBook")

    }
    func searchAction(){
        print("searchAction")

    }
    func addAction(){
       print("addAction")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        if(self.isKind(of:AliPayViewController.self)||self.isKind(of:ReputationViewController.self)||self.isKind(of:FriendViewController.self)||self.isKind(of:MoneyViewController.self)==true){
            let friendItem = UIBarButtonItem(image: UIImage(named: "user"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(showAddressBook))
            let searchItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(searchAction))
            let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addAction))
            
            self.navigationItem.rightBarButtonItems = [searchItem,friendItem,addItem]
        }
        
    
        
       
        
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
