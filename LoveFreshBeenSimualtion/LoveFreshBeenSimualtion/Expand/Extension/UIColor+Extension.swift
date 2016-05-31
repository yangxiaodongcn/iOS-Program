//
//  UIColor+Extension.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/11.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

extension UIColor {

    class func colorWithCustom(red red: CGFloat, gree: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: gree / 255.0, blue: blue / 255.0, alpha: 1)
    }
    
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.colorWithCustom(red: r, gree: g, blue: b)
    }

}