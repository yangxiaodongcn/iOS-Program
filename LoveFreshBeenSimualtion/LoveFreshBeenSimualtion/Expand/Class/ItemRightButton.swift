//
//  ItemRightButton.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/16.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class ItemRightButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let Offset: CGFloat = 15
        
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRect(x: Offset, y: height - Offset, width: width + Offset, height: (titleLabel?.height)!)
        titleLabel?.textAlignment = .center
        
        imageView?.frame = CGRect(x: Offset, y: 0, width: width + Offset, height: height - Offset)
        imageView?.contentMode = UIViewContentMode.center
    }}
