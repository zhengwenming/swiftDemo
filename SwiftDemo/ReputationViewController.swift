



//
//  ReputationViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/16.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class ReputationViewController: BaseViewController,ChangeCity {
    var leftButton:UIButton?
    
    
    override func viewDidLoad() {
        leftButton = UIButton(type: UIButtonType.Custom)
        leftButton!.frame = CGRectMake(0, 0, 70, 40)
        leftButton!.setTitle("广州", forState: UIControlState.Normal)
        leftButton!.titleLabel?.font = UIFont.systemFontOfSize(15)
        leftButton!.addTarget(self, action: "changeCity:", forControlEvents: UIControlEvents.TouchUpInside)
        leftButton!.setImage(UIImage(named: "location"), forState: UIControlState.Normal)
        leftButton!.imageEdgeInsets = UIEdgeInsetsMake(0, -9, 0, 0)
        leftButton!.titleEdgeInsets = UIEdgeInsetsMake(0, 9, 0, 0)

        let leftButtonItem:UIBarButtonItem = UIBarButtonItem(customView: leftButton!)
        self.navigationItem.leftBarButtonItem = leftButtonItem
        super.viewDidLoad()

    }

    func ChangeCityWithCityName(cityName: String) {
        
        
        leftButton?.setTitle((cityName as NSString).substringToIndex(2), forState: UIControlState.Normal)
    }
    
    func changeCity(sender:UIButton){
        print("title = \(sender.currentTitle)")
        let cityList =  CityListViewController();
        cityList.delegate = self
        self.navigationController?.pushViewController(cityList, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
