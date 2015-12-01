
//
//  FriendViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/16.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class FriendViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

     var friendsTable:UITableView?
     var dataArray: NSMutableArray?
    
    
    func loadDataLocal(){
        //两种for循环
        for var index:Int=0;index<1;index++ {
            let friend0:FriendModel = FriendModel(userName:"怕瓦落地",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2012/10/31/104012571.jpg")
            self.dataArray?.addObject(friend0)
            
            let friend1:FriendModel = FriendModel(userName:"王尼玛",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2015/06/17/092631098.jpg")
            self.dataArray?.addObject(friend1)
            
            let friend2:FriendModel = FriendModel(userName:"我的心太乱",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2013/08/13/093640311.jpg")
            self.dataArray?.addObject(friend2)
            
            let friend3:FriendModel = FriendModel(userName:"囧囧有神",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2014/03/25/105620175.jpg")
            self.dataArray?.addObject(friend3)
            
            let friend4:FriendModel = FriendModel(userName:"老衲一头白发",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2014/08/14/114609349.jpg")
            self.dataArray?.addObject(friend4)
            
            let friend5:FriendModel = FriendModel(userName:"大头虾",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2014/08/29/103858872.jpg")
            self.dataArray?.addObject(friend5)
            
            let friend6:FriendModel = FriendModel(userName:"乡巴佬进城",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2015/06/17/092631098.jpg")
            self.dataArray?.addObject(friend6)
            
            let friend7:FriendModel = FriendModel(userName:"萌娜力啥",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2013/08/13/093640311.jpg")
            self.dataArray?.addObject(friend7)
            
            let friend8:FriendModel = FriendModel(userName:"网管我要加钱",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2012/10/31/104012571.jpg")
            self.dataArray?.addObject(friend8)
            
            let friend9:FriendModel = FriendModel(userName:"装萌卖傻",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2012/10/31/104012571.jpg")
            self.dataArray?.addObject(friend9)
            
            let friend10:FriendModel = FriendModel(userName:"中国好胖子",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2013/08/13/093640311.jpg")
            self.dataArray?.addObject(friend10)
            
            let friend11:FriendModel = FriendModel(userName:"哥是个传说",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2014/03/25/105620175.jpg")
            self.dataArray?.addObject(friend11)
            
            let friend12:FriendModel = FriendModel(userName:"寡人从不装逼",userId:String(index),photo:"http://pic.ihk.cn/first/287_h/ihk/2014/08/29/103858872.jpg")
            self.dataArray?.addObject(friend12)
            
        }
        
        /*
        for var index:Int in 0...11{
        let friendInfoDic = ["userName":"怕瓦落地","userId":String(index),"photo":"http://pic.ihk.cn/first/287_h/ihk/2012/10/31/104012571.jpg"]
        let friend0 = FriendModel(infoDic: friendInfoDic)
        
        }
        */
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.dataArray = NSMutableArray()//数据源数组初始化
        loadDataLocal()//加载本地数据
        initTableView()//初始化table
    }

    private func initTableView(){
        friendsTable = UITableView(frame: self.view.bounds, style:.Grouped)
        friendsTable!.delegate = self
        friendsTable!.dataSource = self
//        friendsTable!.registerClass(FriendCell.self, forCellReuseIdentifier: "cell")
        friendsTable!.registerNib(UINib.init(nibName: "FriendCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.view.addSubview(friendsTable!)

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 2;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section==0{
            return 1;
        }else{
            return self.dataArray!.count
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 79;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:FriendCell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! FriendCell
        let model:FriendModel = self.dataArray?.objectAtIndex(indexPath.row) as! FriendModel;
        cell.userNameLabel?.text = "\(model.userName)"
        cell.desLabel?.text = "大家好我是\(model.userName)"
        cell.avatarIV.kf_showIndicatorWhenLoading = true;
        let URL = NSURL(string: model.photo)
        
        cell.avatarIV.kf_setImageWithURL(URL!, placeholderImage: nil, optionsInfo: [.Transition(ImageTransition.Fade(1))], progressBlock: { receivedSize, totalSize in
            print("\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
            }, completionHandler: { image, error, cacheType, imageURL in
                print("\(indexPath.row + 1): Finished")
        })
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
