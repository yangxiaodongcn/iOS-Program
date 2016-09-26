//
//  AppDelegate.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/10.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var adViewController: ADViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setUMeng()
        addNotification()
        buildKeyWindow()
        
        return true
    }
    
    fileprivate func setUMeng() {
        
    }
    
    fileprivate func  addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.showMainTabbarControllerSucess(_:)), name: NSNotification.Name(rawValue: ADImageLoadSecussed), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.showMainTabbarControllerFale), name: NSNotification.Name(rawValue: ADImageLoadFail), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.shoMainTabBarController), name: NSNotification.Name(rawValue: GuideViewControllerDidFinish), object: nil)
    }
    
    fileprivate func buildKeyWindow() {
        window = UIWindow(frame: ScreenBounds)
        window?.makeKeyAndVisible()
        
        let isFristOpen = UserDefaults.standard.object(forKey: "isFristOpenApp")
        
        if isFristOpen == nil {
            window?.rootViewController = GuideViewController()
            UserDefaults.standard.set("isFristOpenApp", forKey: "isFristOpenApp")
        } else {
            loadADRootViewController()
        }
    }
    
    fileprivate func loadADRootViewController() {
        adViewController = ADViewController()
        adViewController!.imageName = "http://img01.bqstatic.com/upload/activity/2016011111271995.jpg"
        window?.rootViewController = adViewController
    }
  
    func showMainTabbarControllerSucess(_ noti: Notification) {
       print(ADImageLoadSecussed)
    }
    
    func showMainTabbarControllerFale() {
       print(ADImageLoadFail)
    }
    
    func shoMainTabBarController() {
       print(GuideViewControllerDidFinish)
    }
}

