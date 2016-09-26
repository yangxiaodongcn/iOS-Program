//
//  ADViewController.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/13.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class ADViewController: UIViewController {
    
    fileprivate lazy var backImageView: UIImageView = UIImageView(frame: ScreenBounds)
    
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
            
            backImageView.sd_setImage(with: URL(string: imageName!), placeholderImage: UIImage(named: placeholderImageName!)) {
                (image, error, _, _) -> Void in
                
                print("In sd_setImageWithURL")
                
                if error != nil {
                    print("加载广告失败")
                    NotificationCenter.default.post(name: Notification.Name(rawValue: ADImageLoadFail), object: nil)
                }
                
                if image != nil {
                    let time_1 = DispatchTime.now() + Double(Int64(1.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                    DispatchQueue.main.asyncAfter(deadline: time_1) {
                        () -> Void in
                        UIApplication.shared.setStatusBarHidden(false, with: UIStatusBarAnimation.fade)
                        
                        print("Delay 1 second")
                        
                        let time_2 = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                            DispatchQueue.main.asyncAfter(deadline: time_2) {
                                
                               print("Delay 05. second")
                                
                               NotificationCenter.default.post(name: Notification.Name(rawValue: ADImageLoadSecussed), object: image)
                        }
                    }
                } else {
                    print("加载广告失败")
                    NotificationCenter.default.post(name: Notification.Name(rawValue: ADImageLoadFail), object: nil)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backImageView)
        UIApplication.shared.setStatusBarHidden(true, with: UIStatusBarAnimation.none)
    }
}
