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
    
    
    func topButtonClick(sender : UITapGestureRecognizer){
        
        let imageView:UIImageView = sender.view as! UIImageView
        
        
        
        switch imageView.tag{
        case 0:

        //MARK: 二维码
        
            let qrcodeVC:QRCodeScanViewController = QRCodeScanViewController()
            
            self.navigationController?.pushViewController(qrcodeVC, animated: true)
        case 1:
            print("\(sender.view?.tag)")
        case 2:
            print("\(sender.view?.tag)")
        case 3:
            print("\(sender.view?.tag)")
        default:
            print("\(sender.view?.tag)")
        }
        

        
    }
    
    private func initTopView(){
      topView = {
            let tempTopView = UIView(frame: CGRectMake(0, kNavbarHeight, kScreenWidth, 2*kNavbarHeight))
            tempTopView.backgroundColor = kThemeColor
            self.view.addSubview(tempTopView)
            return tempTopView
            }()
        let imageViewWidth:CGFloat = (kScreenWidth/4)
        for index:Int in 0...3{
            let imageView = UIImageView()
            imageView.tintColor = UIColor.whiteColor()
            imageView.userInteractionEnabled = true
            imageView.frame = CGRectMake(imageViewWidth * CGFloat(index), 0, imageViewWidth, (topView?.frame.size.height)!)
            let titleLabel = UILabel(frame: CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y+(topView?.frame.size.height)!*2/3, imageViewWidth, 30))
            if index==0{
                imageView.image = UIImage(named: "scan@2x.png")
                titleLabel.text = "扫一扫"
            }else if index==1{
                imageView.image = UIImage(named: "scanStatic@2x.png")
              titleLabel.text = "付款"
            }else if index==2{
                imageView.image = UIImage(named: "scan@2x.png")
                titleLabel.text = "卡券"
            }else if index==3{
                imageView.image = UIImage(named: "scanStatic@2x.png")
                titleLabel.text = "附近"
            }
            titleLabel.textAlignment = NSTextAlignment.Center
            titleLabel.textColor = UIColor.whiteColor()
            imageView.tag = index
            imageView.contentMode = UIViewContentMode.Center;
          let tap = UITapGestureRecognizer(target: self, action: "topButtonClick:")
            imageView .addGestureRecognizer(tap)
            topView?.addSubview(imageView)
            topView?.addSubview(titleLabel)
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
