//
//  View+Extension.swift
//  BeeQuick
//
//  Created by 杨晓冬 on 5/26/16.
//  Copyright © 2016 YangXiaodong. All rights reserved.
//

import UIKit

extension UIView {
    var x: CGFloat {
        return self.frame.origin.x
    }
    var y: CGFloat {
        return self.frame.origin.y
    }
    var width: CGFloat {
        return self.frame.size.width
    }
    var height: CGFloat {
        return self.frame.size.height
    }
    var size: CGSize {
        return self.frame.size
    }
    var point: CGPoint {
        return self.frame.origin
    }
}
