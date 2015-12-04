//
//  QRCodeScanViewController.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/12/3.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit
import AVFoundation

/// 扫描容器
  var customContainerView: UIView!
/// 底部工具条
  var customTabbar: UITabBar!
/// 结果文本
  var customLabel: UILabel!
/// 冲击波视图
  var scanLineView: UIImageView!
///框
    var borderIV: UIImageView!

class QRCodeScanViewController: BaseViewController{
    
    func choosePicFromPhotoLib(sender:UIBarButtonItem){
        // 1.判断是否能够打开相册

        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)
        {
            return
        }
        // 2.创建相册控制器
        let imagePickerVC = UIImagePickerController()
        
        imagePickerVC.delegate = self
        // 3.弹出相册控制器
        presentViewController(imagePickerVC, animated: true, completion: nil)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "扫一扫"
        setUpUI()
        
        startAnimation()

    }

    private func setUpUI(){
        //右边按钮“相册”
        let rightBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "相册", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("choosePicFromPhotoLib:"))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        
       customContainerView = UIView(frame: CGRectMake(0, 0, kScreenWidth-100, kScreenWidth-100))
        customContainerView.center = self.view.center;
        customContainerView.clipsToBounds = true
        self.view.addSubview(customContainerView)
        
        
        customLabel = UILabel(frame: CGRectMake(0, kNavbarHeight+20, kScreenWidth, 40))
        customLabel.textColor = UIColor.whiteColor()
        customLabel.textAlignment = NSTextAlignment.Center
        self.view .addSubview(customLabel)
        
        borderIV = UIImageView(frame: customContainerView.frame)
        borderIV.image = UIImage(named: "codeframe")
        borderIV.clipsToBounds = true
        self.view .addSubview(borderIV)
        
        customTabbar = UITabBar(frame: CGRectMake(0, kScreenHeight-kTabBarHeight, kScreenWidth, 49))
        customTabbar.delegate = self;
        customTabbar.backgroundColor = UIColor.blackColor()
        customTabbar.barTintColor = UIColor.blackColor()
        self.view .addSubview(customTabbar)
        
        let leftBarItem:UITabBarItem = UITabBarItem(title: "", image: UIImage(named: "qrcode_tabbar_icon_qrcode"), selectedImage: UIImage(named: "qrcode_tabbar_icon_qrcode_highlighted"));
        let rightBarItem:UITabBarItem = UITabBarItem(title: "", image: UIImage(named: "qrcode_tabbar_icon_barcode"), selectedImage: UIImage(named: "qrcode_tabbar_icon_barcode_highlighted"));
        customTabbar.setItems([leftBarItem,rightBarItem], animated: true)
        customTabbar.selectedItem = customTabbar.items?.first

        scanLineView = UIImageView(frame:CGRectMake(0, 0-customContainerView.frame.size.height, customContainerView.frame.size.width, customContainerView.frame.size.height))

        scanLineView.image = UIImage(named: "qrcode_scanline_qrcode")
        borderIV.addSubview(scanLineView)
        
        
        scanQRCode()
    }
    // MARK: - 内部控制方法
    private func scanQRCode()
    {
        // 1.判断输入能否添加到会话中
        if !session.canAddInput(input)
        {
            return
        }
        // 2.判断输出能够添加到会话中
        if !session.canAddOutput(output)
        {
            return
        }
        // 3.添加输入和输出到会话中
        session.addInput(input)
        session.addOutput(output)
        
        // 4.设置输出能够解析的数据类型
        // 注意点: 设置数据类型一定要在输出对象添加到会话之后才能设置
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        
        // 5.设置监听监听输出解析到的数据
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        // 6.添加预览图层
        view.layer.insertSublayer(previewLayer, atIndex: 0)
        previewLayer.frame = view.bounds
        
        // 7.添加容器图层
        view.layer.addSublayer(containerLayer)
        containerLayer.frame = view.bounds
        
        // 8.开始扫描
        session.startRunning()
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    private func startAnimation()
    {
        
        // 2.执行扫描动画
        UIView.animateWithDuration(1.5) { () -> Void in
            UIView.setAnimationRepeatCount(MAXFLOAT)

            if (customTabbar.selectedItem == customTabbar.items?.first){
                scanLineView.frame = CGRectMake(scanLineView.frame.origin.x, scanLineView.frame.origin.y+customContainerView.frame.size.height+100, scanLineView.frame.size.width, scanLineView.frame.size.height)

            }else{
                scanLineView.frame = CGRectMake(scanLineView.frame.origin.x, borderIV.frame.origin.y+borderIV.frame.size.height, borderIV.frame.size.width, borderIV.frame.size.height)

            }

            
            
        }
        
    }
    
    // MARK: - 懒加载
    private lazy var input: AVCaptureDeviceInput? = {
       let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        return try? AVCaptureDeviceInput(device: device)
    }()
    
    private lazy var session:AVCaptureSession = AVCaptureSession()
    
    private lazy var output:AVCaptureMetadataOutput = {
        let out = AVCaptureMetadataOutput()
        let viewRect = self.view.frame
        let containerRect = customContainerView.frame;
        let x = containerRect.origin.y / viewRect.height;
        let y = containerRect.origin.x / viewRect.width;
        let width = containerRect.height / viewRect.height;
        let height = containerRect.width / viewRect.width;

        out.rectOfInterest = CGRect(x: x, y: y, width: width, height: height)
        
        return out
    }()

    private lazy var containerLayer:CALayer = CALayer()
    
    /// 预览图层
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.session)

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension QRCodeScanViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        // 1.取出选中的图片
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else
        {
            return
        }
        
        guard let ciImage = CIImage(image: image) else
        {
            return
        }
        
        // 2.从选中的图片中读取二维码数据
        // 2.1创建一个探测器
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyLow])
        // 2.2利用探测器探测数据
        let results = detector.featuresInImage(ciImage)
        // 2.3取出探测到的数据
        for result in results
        {
            print((result as! CIQRCodeFeature).messageString)
            customLabel.text = (result as! CIQRCodeFeature).messageString
        }
        
        picker.dismissViewControllerAnimated(true) { () -> Void in
            self.startAnimation()
        }
    }
}

extension QRCodeScanViewController: AVCaptureMetadataOutputObjectsDelegate
{
    /// 只要扫描到结果就会调用
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!)
    {
        // 1.显示结果

        print(metadataObjects.last?.stringValue)
        customLabel.text =  metadataObjects.last?.stringValue

        clearLayers()
        
        // 2.拿到扫描到的数据
        guard let metadata = metadataObjects.last as? AVMetadataObject else
        {
            return
        }
        // 通过预览图层将corners值转换为我们能识别的类型
        let objc = previewLayer.transformedMetadataObjectForMetadataObject(metadata)
        // 2.对扫描到的二维码进行描边
        drawLines(objc as! AVMetadataMachineReadableCodeObject)
    }
    
    /// 绘制描边
    private func drawLines(objc: AVMetadataMachineReadableCodeObject)
    {
        
        // 0.安全校验
        guard let array = objc.corners else
        {
            return
        }
        
        // 1.创建图层, 用于保存绘制的矩形
        let layer = CAShapeLayer()
        layer.lineWidth = 2
        layer.strokeColor = UIColor.greenColor().CGColor
        layer.fillColor = UIColor.clearColor().CGColor
        
        // 2.创建UIBezierPath, 绘制矩形
        let path = UIBezierPath()
        var point = CGPointZero
        var index = 0
        CGPointMakeWithDictionaryRepresentation((array[index++] as! CFDictionary), &point)
        
        // 2.1将起点移动到某一个点
        path.moveToPoint(point)
        
        // 2.2连接其它线段
        while index < array.count
        {
            CGPointMakeWithDictionaryRepresentation((array[index++] as! CFDictionary), &point)
            path.addLineToPoint(point)
        }
        // 2.3关闭路径
        path.closePath()
        
        layer.path = path.CGPath
        // 3.将用于保存矩形的图层添加到界面上
        containerLayer.addSublayer(layer)
    }
    
    /// 清空描边
    private func clearLayers()
    {
        guard let subLayers = containerLayer.sublayers else
        {
            return
        }
        for layer in subLayers
        {
            layer.removeFromSuperlayer()
        }
    }
}




extension QRCodeScanViewController: UITabBarDelegate
{
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        // 根据当前选中的按钮重新设置二维码容器高度
        if (tabBar.selectedItem == customTabbar.items?.first){
            UIView.animateWithDuration(0.5) { () -> Void in
                borderIV.frame = customContainerView.frame
                borderIV.center = self.view.center;
                scanLineView.image = UIImage(named: "qrcode_scanline_qrcode")

            }
  
        }else{
            UIView.animateWithDuration(0.5) { () -> Void in
                borderIV.frame = CGRectMake(borderIV.frame.origin.x, borderIV.frame.origin.y, borderIV.frame.size.width, borderIV.frame.size.width/2)
                borderIV.center = self.view.center;
                scanLineView.image = UIImage(named: "qrcode_scanline_barcode")

            }
        }
    }
}