//
//  UpImageDownTextButton.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/16.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class UpImageDownTextButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRect(x: 0, y: height - 15, width: width, height: (titleLabel?.height)!)
        titleLabel?.textAlignment = .center
        
        imageView?.frame = CGRect(x: 0, y: 0, width: width, height: height - 15)
        imageView?.contentMode = UIViewContentMode.center
    }

}
