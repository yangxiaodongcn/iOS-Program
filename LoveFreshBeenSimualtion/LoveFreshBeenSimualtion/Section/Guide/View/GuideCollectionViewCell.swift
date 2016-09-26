//
//  GuideCollectionViewCell.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/11.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
    
    fileprivate var imageView: UIImageView?
    fileprivate var nextButton: UIButton?
    
    var image: UIImage? {
        didSet {
            imageView!.image = image
        }
    }
    
    var nextButtonHidden: Bool? {
        didSet {
            if let hidden = nextButtonHidden {
                nextButton?.isHidden = hidden
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: ScreenBounds)
        imageView!.contentMode = UIViewContentMode.scaleAspectFill
        contentView.addSubview(imageView!)
        
        nextButton = UIButton(frame: CGRect(x: (ScreenBounds.width-100)/2, y: ScreenBounds.height-90, width: 100, height: 33))
        nextButton!.setBackgroundImage(UIImage(named: "icon_next"), for: UIControlState())
        nextButton!.isHidden = true
        nextButton!.addTarget(self, action: #selector(GuideCollectionViewCell.nextButtonClick), for: UIControlEvents.touchUpInside)
        contentView.addSubview(nextButton!)
    }
    
    func nextButtonClick() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: GuideViewControllerDidFinish), object: nil)
    }
}
