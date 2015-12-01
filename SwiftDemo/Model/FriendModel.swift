//
//  FriendModel.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/12/1.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class FriendModel: NSObject {
    var userName:String!
    var userId:String!
    var photo:String!
    
    //提供两个init方法
    init(userName:String,userId:String,photo:String) {
        super.init()
        self.userName = userName;
        self.userId = userId;
        self.photo = photo;
    }
    
    init(infoDic:NSDictionary) {
        super.init()
        self.userId = infoDic["userId"] as! String
        self.userName = infoDic["userName"] as! String
        self.photo = infoDic["photo"] as! String
    }
}
