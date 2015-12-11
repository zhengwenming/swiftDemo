

//
//  CityListViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/12/1.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

import CoreLocation


///声明一个protocal，必须继承NSObjectProtocal

protocol ChangeCity:NSObjectProtocol{
    func ChangeCityWithCityName(cityName:String)
}


class CityListViewController: BaseViewController ,UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate{
    var currentCityLabel:UILabel?
    var friendsTable:UITableView?
    var cities:NSDictionary?
    var keys:[String]?
    weak var delegate:ChangeCity?
    var locationManager : CLLocationManager = CLLocationManager()

    var currLocation : CLLocation!

    func loadData(){
        let path:String  = NSBundle.mainBundle().pathForResource("citydict", ofType: "plist")!
        cities = NSDictionary(contentsOfFile: path)
        
    
        let allkeys = cities!.allKeys as NSArray;
        let sortedStates = allkeys.sortedArrayUsingSelector(Selector("compare:"));
        keys = sortedStates as? Array<String>;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }
    override func viewWillDisappear(animated: Bool) {
        locationManager.stopUpdatingLocation()
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
      currLocation = locations.last! as CLLocation
//        longitudeTxt.text = "\(currLocation.coordinate.longitude)"
//        latitudeTxt.text = "\(currLocation.coordinate.latitude)"
//        HeightTxt.text = "\(currLocation.altitude)"
        self.reverseGeocode(currLocation)
    }
    
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){

        print(error)
    }
    
    func reverseGeocode(sender: AnyObject) {
        let geocoder = CLGeocoder()
        var p:CLPlacemark?
        geocoder.reverseGeocodeLocation(currLocation, completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                print("reverse geodcode fail: \(error!.localizedDescription)")
                return
            }
            let pm = placemarks! as [CLPlacemark]
            if (pm.count > 0){
                p = placemarks![0]
                let arrayforProvince:Array = (p?.name!.componentsSeparatedByString("省"))!
                let city:String = arrayforProvince.last!
                let  arrayforcity:Array = city.componentsSeparatedByString("市")
                self.currentCityLabel?.text = "    " + (arrayforcity.first)!
            }else{
                print("No Placemarks!")
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "选择城市"
        
        locationManager = CLLocationManager()
        if self.locationManager.respondsToSelector("requestAlwaysAuthorization") {
            print("requestAlwaysAuthorization")
            if #available(iOS 8.0, *) {
                self.locationManager.requestAlwaysAuthorization()
            } else {
                // Fallback on earlier versions
            }
        }
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()

        loadData()
        initUI()
        
    }
    func tapToChangeCity(sender:UITapGestureRecognizer){
        if((currentCityLabel?.text?.isEmpty) == nil){
            return
        }
        let city:String = ((currentCityLabel?.text)! as NSString).substringFromIndex(4)
        self.delegate?.ChangeCityWithCityName(city)
        self.navigationController?.popViewControllerAnimated(true)
    }
    private func initUI(){
        
        let headerLabel = UILabel()
        headerLabel.frame = CGRectMake(0, kNavbarHeight, kScreenWidth, 20)
        headerLabel.text = "   当前城市"
        headerLabel.backgroundColor = kBackGroundColor
        self.view.addSubview(headerLabel)
        
        currentCityLabel = UILabel()
        currentCityLabel!.frame = CGRectMake(headerLabel.frame.origin.x, headerLabel.frame.origin.y+headerLabel.frame.size.height, headerLabel.frame.size.width, headerLabel.frame.size.height+10)
        currentCityLabel!.backgroundColor = UIColor.whiteColor()
        currentCityLabel?.textColor = UIColor.orangeColor()
        currentCityLabel?.userInteractionEnabled = true
        self.view .addSubview(currentCityLabel!)
        
        let tap = UITapGestureRecognizer(target:self, action: "tapToChangeCity:")
        currentCityLabel?.addGestureRecognizer(tap)
        
        friendsTable = UITableView(frame: CGRectMake((currentCityLabel?.frame.origin.x)!, (currentCityLabel?.frame.origin.y)!+(currentCityLabel?.frame.size.height)!, (currentCityLabel?.frame.size.width)!, (kScreenHeight-(currentCityLabel?.frame.size.height)!)-headerLabel.frame.size.height), style:.Plain)
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
