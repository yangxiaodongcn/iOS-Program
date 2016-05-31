//
//  Color+Extension.swift
//  LoveFreshBeen
//
//  Created by 杨晓冬 on 4/26/16.
//  Copyright © 2016 YangXiaodong. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorWithCustom(red red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
    }
    
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.colorWithCustom(red: r, green: g, blue: b)
    }
    
}
