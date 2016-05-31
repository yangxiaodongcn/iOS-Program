//
//  GuideModel.swift
//  LoveFreshBeen
//
//  Created by 杨晓冬 on 4/20/16.
//  Copyright © 2016 YangXiaodong. All rights reserved.
//

import UIKit

class GuideModel: NSObject {

    static let instance = GuideModel()
    
    var images: [UIImage]?
    
    private override init() {
        super.init()
        
        images = Array<UIImage>()
        
        let image_1 = UIImage(named: "guide_2")
        images?.append(image_1!)
        let image_2 = UIImage(named: "guide_1")
        images?.append(image_2!)
        let image_3 = UIImage(named: "guide_3")
        images?.append(image_3!)
        let image_4 = UIImage(named: "guide_4")
        images?.append(image_4!)
    }
}
