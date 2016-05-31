//
//  GuideCollectionViewCell.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/11.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView?
    private var nextButton: UIButton?
    
    var image: UIImage? {
        didSet {
            imageView!.image = image
        }
    }
    
    var nextButtonHidden: Bool? {
        didSet {
            if let hidden = nextButtonHidden {
                nextButton?.hidden = hidden
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: ScreenBounds)
        imageView!.contentMode = UIViewContentMode.ScaleAspectFill
        contentView.addSubview(imageView!)
        
        nextButton = UIButton(frame: CGRectMake((ScreenBounds.width-100)/2, ScreenBounds.height-90, 100, 33))
        nextButton!.setBackgroundImage(UIImage(named: "icon_next"), forState: UIControlState.Normal)
        nextButton!.hidden = true
        nextButton!.addTarget(self, action: "nextButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
        contentView.addSubview(nextButton!)
    }
    
    func nextButtonClick() {
        NSNotificationCenter.defaultCenter().postNotificationName(GuideViewControllerDidFinish, object: nil)
    }
}
