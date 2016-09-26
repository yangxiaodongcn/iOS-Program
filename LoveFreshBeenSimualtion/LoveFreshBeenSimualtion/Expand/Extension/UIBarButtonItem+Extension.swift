//
//  UIBarButtonItem+Extension.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/16.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

enum ItemButtonType: Int {
    case left = 0
    case right = 1
}

extension UIBarButtonItem {
    
    class func barButton(_ title: String, titleColor: UIColor, image: UIImage, highLightImage: UIImage?, target: AnyObject?, action: Selector, type: ItemButtonType) -> UIBarButtonItem {
        
        var btn: UIButton
        
        if type == ItemButtonType.left {
            btn = ItemLeftButton(type: .custom)
        } else {
            btn = ItemRightButton(type: .custom)
        }
        
        btn.setTitle(title, for: UIControlState())
        btn.setTitleColor(titleColor, for: UIControlState())
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.setImage(image, for: UIControlState())
        btn.setImage(highLightImage, for: .highlighted)
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem(customView: btn)
    }
    
    class func barButton(_ image: UIImage, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        let btn = ItemLeftImageButton(type: .custom)
        btn.setImage(image, for: UIControlState())
        btn.imageView?.contentMode = UIViewContentMode.center
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        return UIBarButtonItem(customView: btn)
    }
    
    class func barButton(_ title: String, titleColor: UIColor, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        btn.setTitle(title, for: UIControlState())
        btn.setTitleColor(titleColor, for: UIControlState())
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        if title.characters.count == 2 {
            btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -25)
        }
        return UIBarButtonItem(customView: btn)
    }
}
