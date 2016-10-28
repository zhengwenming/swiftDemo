



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
        leftButton = UIButton(type: UIButtonType.custom)
        leftButton?.frame = CGRect(x:0, y:0, width:70, height:40)
        leftButton?.setTitle("广州", for: UIControlState.normal)
        leftButton?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        leftButton?.addTarget(self, action:#selector(changeCity(sender:)), for: UIControlEvents.touchUpInside)
        leftButton?.setImage(UIImage(named: "location"), for: UIControlState.normal)
        leftButton?.imageEdgeInsets = UIEdgeInsetsMake(0, -9, 0, 0)
        leftButton?.titleEdgeInsets = UIEdgeInsetsMake(0, 9, 0, 0)

        let leftButtonItem:UIBarButtonItem = UIBarButtonItem(customView: leftButton!)
        navigationItem.leftBarButtonItem = leftButtonItem
        super.viewDidLoad()

    }

    func ChangeCityWithCityName(cityName: String) {
        leftButton?.setTitle((cityName as NSString).substring(to: 2), for: UIControlState.normal)
    }
    
    func changeCity(sender:UIButton){
        let cityList =  CityListViewController();
        cityList.delegate = self
        self.navigationController?.pushViewController(cityList, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
