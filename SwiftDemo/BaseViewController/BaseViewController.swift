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
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        if(self.isKindOfClass(AliPayViewController)||self.isKindOfClass(ReputationViewController)||self.isKindOfClass(FriendViewController)||self.isKindOfClass(MoneyViewController)==true){
            let friendItem = UIBarButtonItem(image: UIImage(named: "user"), style: UIBarButtonItemStyle.Plain, target: self, action: "showAddressBook")
            let searchItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: "searchAction")
            let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addAction")
            
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
