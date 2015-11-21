//
//  MoneyViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/16.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class MoneyViewController: BaseViewController {

    override func viewDidLoad() {

        

        super.viewDidLoad()
        self.creatTestBtn()
        
       }

    func creatTestBtn(){
        let testBtn = UIButton.init(type: UIButtonType.Custom)
        testBtn.frame = CGRectMake(50, 120, 100, 50)
        testBtn.backgroundColor = UIColor.redColor()
        testBtn.setTitle("测试跳转", forState: UIControlState.Normal)
        
        testBtn .addTarget(self, action: "testAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(testBtn)
        
    }
    func testAction(sender:UIButton){
        print( "ffffffff" );
        let testVC = TestViewController.init(nibName: nil, bundle: nil)
        testVC.title = "test"
        self.navigationController?.pushViewController(testVC, animated: true)
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
