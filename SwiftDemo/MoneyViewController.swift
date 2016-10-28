//
//  MoneyViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/11/16.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class MoneyViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    let dataSource:NSMutableArray = NSMutableArray()
    var cv:UICollectionView?
    func loadData(){
            let sectionArray0 = [["imgName":"balance","title":"余额","des":"666.66"],["imgName":"bankcard","title":"银行卡","des":"4"],["imgName":"mfund","title":"余额宝","des":"0.66"],["imgName":"fixed","title":"招财宝","des":"灵活的定期理财"],["imgName":"stock","title":"股票","des":"查看详情"],["imgName":"jiebei","title":"基金","des":"买入费率1折起"],["imgName":"yulebao","title":"娱乐宝","des":"谁是你的菜8.88%"],["imgName":"","title":"","des":""]];
                dataSource.add(sectionArray0)
        
              let sectionArray1 = [["imgName":"credit","title":"芝麻信用分","des":"666"],["imgName":"huabei","title":"芝麻花呗","des":"600.00"]];
                dataSource.add(sectionArray1)

                let sectionArray2 = [["imgName":"tipIcon1","title":"我的保障","des":"有保障更安心"],["imgName":"balance","title":"淘宝众筹","des":"认真对待每一个梦想"],["imgName":"charity","title":"爱心捐赠","des":"我要捐赠"],["imgName":"","title":"","des":""]];
                dataSource.add(sectionArray2)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.initCollectionView()
        
       }
    //MARK: initCollectionView
    func initCollectionView(){
        
        let defaultLayout = UICollectionViewFlowLayout()
        defaultLayout.scrollDirection = UICollectionViewScrollDirection.vertical//设置垂直显示
        defaultLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)//设置边距
        //defaultLayout.itemSize = CGSizeMake(kScreenWidth/2, 50) //设置所有cell的size
        defaultLayout.minimumLineSpacing = 0.0  //每个相邻layout的上下间隔
        defaultLayout.minimumInteritemSpacing = 0.0 //每个相邻layou的左右间隔
        defaultLayout.headerReferenceSize = CGSize(width: 0, height: 0)
        defaultLayout.footerReferenceSize = CGSize(width: 0, height: 15)
        
        
        cv = UICollectionView(frame: CGRect(x:0, y:0, width:kScreenWidth, height:kScreenHeight), collectionViewLayout: defaultLayout)
        cv!.backgroundColor = UIColor.white
        cv!.register(UINib(nibName: "MoneyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoneyCollectionViewCell")
        cv!.dataSource = self
        cv!.delegate = self
        self.view.addSubview(cv!)
        
    }
  
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count;
    }
    
    // MARK:   numberOfItems
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        let sectionArray:NSArray = dataSource.object(at: section) as! NSArray
        return sectionArray.count;
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{

        let cell:MoneyCollectionViewCell  = cv!.dequeueReusableCell(withReuseIdentifier: "MoneyCollectionViewCell", for: indexPath as IndexPath) as! MoneyCollectionViewCell
        let sectionArray:NSArray = dataSource.object(at: indexPath.section) as! NSArray
        let rowDic:NSDictionary = sectionArray.object(at: indexPath.row) as! NSDictionary
        cell.titleLabel.text = rowDic["title"] as? String
        cell.titleIV.image =  UIImage(named: rowDic["imgName"]as! String)
        cell.desLabel.text = rowDic["des"] as? String
        cell.layer.borderColor = UIColor.lightGray.cgColor;
        cell.layer.borderWidth = 0.25;
        return cell;
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("点击了第\(indexPath.section) 分区 ,第\(indexPath.row) 个元素")
    }
    
    private func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
        return CGSize(width: kScreenWidth/2.0, height: 81)
    }
    

    
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
