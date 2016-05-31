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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        setUMeng()
        addNotification()
        buildKeyWindow()
        
        return true
    }
    
    private func setUMeng() {
        
    }
    
    private func  addNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMainTabbarControllerSucess:", name: ADImageLoadSecussed, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMainTabbarControllerFale", name: ADImageLoadFail, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "shoMainTabBarController", name: GuideViewControllerDidFinish, object: nil)
    }
    
    private func buildKeyWindow() {
        window = UIWindow(frame: ScreenBounds)
        window?.makeKeyAndVisible()
        
        let isFristOpen = NSUserDefaults.standardUserDefaults().objectForKey("isFristOpenApp")
        
        if isFristOpen == nil {
            window?.rootViewController = GuideViewController()
            NSUserDefaults.standardUserDefaults().setObject("isFristOpenApp", forKey: "isFristOpenApp")
        } else {
            loadADRootViewController()
        }
    }
    
    private func loadADRootViewController() {
        adViewController = ADViewController()
        adViewController!.imageName = "http://img01.bqstatic.com/upload/activity/2016011111271995.jpg"
        window?.rootViewController = adViewController
    }
  
    func showMainTabbarControllerSucess(noti: NSNotification) {
       print(ADImageLoadSecussed)
    }
    
    func showMainTabbarControllerFale() {
       print(ADImageLoadFail)
    }
    
    func shoMainTabBarController() {
       print(GuideViewControllerDidFinish)
    }
}

