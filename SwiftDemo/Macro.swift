//
//  Macro.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/17.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import Foundation

import UIKit

//let  kColor_Theme   =             ([MSUtil colorWithHexString:@"#353535"]) // ffffff   白                                  //主题颜色
//
//
//#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]
//#define kNavbarHeight ((kDeviceVersion>=7.0)? 64 :44 )
//#define kIOS7DELTA   ((kDeviceVersion>=7.0)? 20 :0 )
//#define kTabBarHeight 49
//
//#define kHistory @"History"
//
//#define TheUserDefaults [NSUserDefaults standardUserDefaults]


let kScreenWidth:CGFloat    = UIScreen.mainScreen().bounds.width
let kScreenHeight:CGFloat   = UIScreen.mainScreen().bounds.height
let kNavbarHeight:CGFloat   = 64
let TheUserDefaults         = NSUserDefaults.standardUserDefaults()
let kDeviceVersion          = Float(UIDevice.currentDevice().systemVersion)
let kTabBarHeight:CGFloat   = 49
let kThemeColor     = UIColor(red: 63.0/255.0, green: 67.0/255.0, blue: 76.0/255.0, alpha: 1.0)
