//
//  ADViewController.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/13.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class ADViewController: UIViewController {
    
    private lazy var backImageView: UIImageView = UIImageView(frame: ScreenBounds)
    
    var imageName: String? {
        didSet {
            var placeholderImageName: String?
            switch UIDevice.currentDeviceScreenMeasurement() {
            case 3.5:
                placeholderImageName = "iphone4"
            case 4.0:
                placeholderImageName = "iphone5"
            case 4.7:
                placeholderImageName = "iphone6"
            default:
                placeholderImageName = "iphone6s"
            }
            
            backImageView.sd_setImageWithURL(NSURL(string: imageName!), placeholderImage: UIImage(named: placeholderImageName!)) {
                (image, error, _, _) -> Void in
                
                print("In sd_setImageWithURL")
                
                if error != nil {
                    print("加载广告失败")
                    NSNotificationCenter.defaultCenter().postNotificationName(ADImageLoadFail, object: nil)
                }
                
                if image != nil {
                    let time_1 = dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC)))
                    dispatch_after(time_1, dispatch_get_main_queue()) {
                        () -> Void in
                        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.Fade)
                        
                        print("Delay 1 second")
                        
                        let time_2 = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
                            dispatch_after(time_2, dispatch_get_main_queue()) {
                                
                               print("Delay 05. second")
                                
                               NSNotificationCenter.defaultCenter().postNotificationName(ADImageLoadSecussed, object: image)
                        }
                    }
                } else {
                    print("加载广告失败")
                    NSNotificationCenter.defaultCenter().postNotificationName(ADImageLoadFail, object: nil)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backImageView)
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
    }
}
