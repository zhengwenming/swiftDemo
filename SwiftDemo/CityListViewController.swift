

//
//  CityListViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/12/1.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

///声明一个protocal，必须继承NSObjectProtocal

protocol ChangeCity:NSObjectProtocol{
    func ChangeCityWithCityName(cityName:String)
}


class CityListViewController: BaseViewController ,UITableViewDataSource,UITableViewDelegate{

    var friendsTable:UITableView?
    var cities:NSDictionary?
    var keys:[String]?
    weak var delegate:ChangeCity?
    
    func loadData(){
        let path:String  = NSBundle.mainBundle().pathForResource("citydict", ofType: "plist")!
        cities = NSDictionary(contentsOfFile: path)
        
    
        let allkeys = cities!.allKeys as NSArray;
        let sortedStates = allkeys.sortedArrayUsingSelector(Selector("compare:"));
        keys = sortedStates as? Array<String>;
        print(keys)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "选择城市"
        loadData()
        initTableView()
    }
    private func initTableView(){
        friendsTable = UITableView(frame: self.view.bounds, style:.Plain)
        friendsTable!.delegate = self
        friendsTable!.dataSource = self
        friendsTable!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(friendsTable!)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return (keys?.count)!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let keys_:NSArray = NSArray(array: keys!);
        let key = keys_.objectAtIndex(section)
        
        let temp:NSArray = (cities?.objectForKey(key))! as! NSArray
        return temp.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
         let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        let keysTemp:NSArray = NSArray(array: keys!);

        let key = keysTemp.objectAtIndex(indexPath.section)
        
        let temp:NSArray = (cities?.objectForKey(key))! as! NSArray
        
        cell.textLabel?.text = temp.objectAtIndex(indexPath.row) as? String
        return cell
    }
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return keys
    }

    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel  = UILabel(frame: CGRectMake(0, 0, tableView.frame.size.width, 20))
        headerLabel.backgroundColor = kBackGroundColor
        let keys_:NSArray = NSArray(array: keys!);
        
        let key = keys_.objectAtIndex(section)
        let textString = "    "+(key as? String)!;
        headerLabel.text = textString
        return headerLabel
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20;
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let keysTemp:NSArray = NSArray(array: keys!);
        
        let key = keysTemp.objectAtIndex(indexPath.section)
        
        let temp:NSArray = (cities?.objectForKey(key))! as! NSArray
        
        self.delegate?.ChangeCityWithCityName(temp.objectAtIndex(indexPath.row) as! String)
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
