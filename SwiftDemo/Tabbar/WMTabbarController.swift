

//
//  WMTabbarController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/16.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class WMTabbarController: UITabBarController {

    var aliPay = AliPayViewController()
    var reputationVC = ReputationViewController()
    var friendVC = FriendViewController()
    var moneyVC = MoneyViewController()

   
    
     func creatSubViewControllers(){
        let aliNav = BaseNavgationController(rootViewController:aliPay)
        let aliItem = UITabBarItem.init(title: "支付宝", image: UIImage.init(named: "TabBar_HomeBar"), selectedImage: UIImage.init(named: "TabBar_HomeBar_Sel"))
        aliNav.tabBarItem = aliItem
        
        let reputationNav = BaseNavgationController(rootViewController:reputationVC)
        let reputationItem = UITabBarItem.init(title: "口碑", image: UIImage.init(named: "TabBar_Businesses"), selectedImage: UIImage.init(named: "TabBar_Businesses_Sel"))
        reputationNav.tabBarItem = reputationItem;
        
        let friendNav = BaseNavgationController(rootViewController: friendVC)
        let friendItem = UITabBarItem.init(title: "朋友", image: UIImage.init(named: "TabBar_Friends"), selectedImage: UIImage.init(named: "TabBar_Friends_Sel"))
        friendNav.tabBarItem = friendItem;
        
        let moneyNav = BaseNavgationController(rootViewController: moneyVC)
        let moneyItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "TabBar_Assets"), selectedImage: UIImage.init(named: "TabBar_Assets_Sel"))
        moneyNav.tabBarItem = moneyItem;
        
        self.viewControllers = [aliNav,reputationNav,friendNav,moneyNav];
        //        self.tabBar.tintColor = UIColor.redColor()
    }
    
    override func viewDidLoad() {
        
        //创建tabbar的子控制器
        self.creatSubViewControllers()
            
        
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
