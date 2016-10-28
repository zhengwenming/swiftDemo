//
//  BaseNavgationController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/16.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit


class BaseNavgationController: UINavigationController,UINavigationControllerDelegate {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let textAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 18),NSForegroundColorAttributeName:UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = kThemeColor
        UINavigationBar.appearance().isTranslucent = true
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent;
    }
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//    override init(rootViewController: UIViewController) {
//        super.init(rootViewController: rootViewController)
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if(self.viewControllers.count>0){
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)

    }

}
