//
//  AnimationTabBarController.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/14.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class AnimationTabBarController: UITabBarController {
    
    var iconsView: [(icon: UIImageView, textLabel: UILabel)] = []
    var iconsImageName: [String] = ["v2_home", "v2_order", "shopCart", "v2_my"]
    var iconsSelectedImageName: [String] = ["v2_home", "v2_order", "shopCart", "v2_my"]
    var shopCarIcon: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: "searchViewControllerDeinit", name: NSNotification.Name(rawValue: "LFBSearchViewControllerDeinit"), object: nil)
    }
    
    func LFBSearchViewControllerDeinit() {
        
    }
}
