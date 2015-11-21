//
//  AliPayViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/16.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class AliPayViewController: BaseViewController {
    
    var topView:UIView?
    
    
    func topButtonClick(sender : UIButton){
        switch sender.tag{
        case 0:
            print("\(sender.tag)")
        case 1:
            print("\(sender.tag)")
        case 2:
            print("\(sender.tag)")
        case 3:
            print("\(sender.tag)")
        default:
            print("\(sender.tag)")
        }
        

        
    }
    
    private func initTopView(){
      topView = {
            let tempTopView = UIView(frame: CGRectMake(0, kNavbarHeight, kScreenWidth, 2*kNavbarHeight))
            tempTopView.backgroundColor = kThemeColor
            self.view.addSubview(tempTopView)
            return tempTopView
            }()
        let btnWidth:CGFloat = (kScreenWidth/4)
        for index:Int in 0...3{
            var button = UIButton(type: .Custom)
            button.tintColor = UIColor.whiteColor()
            
            if index==0{
                button.setImage(UIImage(named: "scan@2x.png"), forState: .Normal)
                button.setImage(UIImage(named: "scan@2x.png"), forState: .Selected)
                button.setTitle("扫一扫", forState: .Normal)
                button.titleEdgeInsets = UIEdgeInsetsMake(-20, -18, -60, 0)
                button.imageEdgeInsets = UIEdgeInsetsMake(-20, 18, 0, 0)
            }else if index==1{
                button.setImage(UIImage(named: "scanStatic@2x.png"), forState: .Normal)
                button.setImage(UIImage(named: "scanStatic@2x.png"), forState: .Selected)
                button.setTitle("付款", forState: .Normal)
                button.titleEdgeInsets = UIEdgeInsetsMake(-20, -23, -60, 0)
                button.imageEdgeInsets = UIEdgeInsetsMake(-20, 21, 0, 0)
            }else if index==2{
                button.setImage(UIImage(named: "scan@2x.png"), forState: .Normal)
                button.setImage(UIImage(named: "scan@2x.png"), forState: .Selected)
                button.setTitle("卡券", forState: .Normal)
                button.titleEdgeInsets = UIEdgeInsetsMake(-20, -23, -60, 0)
                button.imageEdgeInsets = UIEdgeInsetsMake(-20, 21, 0, 0)

            }else if index==3{
                button.setImage(UIImage(named: "scanStatic@2x.png"), forState: .Normal)
                button.setImage(UIImage(named: "scanStatic@2x.png"), forState: .Selected)
                button.setTitle("附近", forState: .Normal)
                button.titleEdgeInsets = UIEdgeInsetsMake(-20, -23, -60, 0)
                button.imageEdgeInsets = UIEdgeInsetsMake(-20, 21, 0, 0)
            }
            
            button.frame = CGRectMake(btnWidth * CGFloat(index), 0, btnWidth, (topView?.frame.size.height)!)
            button.tag = index
            button.addTarget(self, action: "topButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
            topView?.addSubview(button)
            
        }
 
    }

    
    func showMyOrder(){
        print("ffff")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let leftItem = UIBarButtonItem(title: "账单", style: UIBarButtonItemStyle.Plain, target: self, action: "showMyOrder")
        self.navigationItem.leftBarButtonItem = leftItem
            initTopView()

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
