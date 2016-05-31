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
        titleLabel?.frame = CGRectMake(0, height - 15, width, (titleLabel?.height)!)
        titleLabel?.textAlignment = .Center
        
        imageView?.frame = CGRectMake(0, 0, width, height - 15)
        imageView?.contentMode = UIViewContentMode.Center
    }

}
