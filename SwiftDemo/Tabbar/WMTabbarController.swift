

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

    let vcArray = ["AliPayViewController","ReputationViewController","FriendViewController","MoneyViewController"]
   required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override func viewDidLoad() {
        
        
            
                let aliNav = BaseNavgationController(rootViewController:aliPay)
                let aliItem = UITabBarItem.init(title: "支付宝", image: UIImage.init(named: "TabBar_HomeBar"), selectedImage: UIImage.init(named: "TabBar_HomeBar_Sel"))
                aliNav.tabBarItem = aliItem

                let reputationNav = BaseNavgationController(rootViewController:reputationVC)
                let reputationItem = UITabBarItem.init(title: "口碑", image: UIImage.init(named: "TabBar_Businesses"), selectedImage: UIImage.init(named: "TabBar_Businesses_Sel"))
                reputationNav.tabBarItem = reputationItem;
                self .addChildViewController(reputationNav)

                let friendNav = BaseNavgationController(rootViewController: friendVC)
                let friendItem = UITabBarItem.init(title: "朋友", image: UIImage.init(named: "TabBar_Friends"), selectedImage: UIImage.init(named: "TabBar_Friends_Sel"))
                friendNav.tabBarItem = friendItem;
                self .addChildViewController(friendNav)

                let moneyNav = BaseNavgationController(rootViewController: moneyVC)
                let moneyItem = UITabBarItem.init(title: "财富", image: UIImage.init(named: "TabBar_Assets"), selectedImage: UIImage.init(named: "TabBar_Assets_Sel"))
                moneyNav.tabBarItem = moneyItem;

        self.setViewControllers([aliNav,reputationNav,friendNav,moneyNav], animated: true)
        
//        self.tabBar.tintColor = UIColor.redColor()
        super.viewDidLoad()

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
