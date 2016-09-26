//
//  AddressTitleView.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/16.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class AddressTitleView: UIView {

    fileprivate let playLabel = UILabel()
    fileprivate let titleLabel = UILabel()
    fileprivate let arrowImageView = UIImageView(image: UIImage(named: "allowBlack"))
    var addressWidth: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        playLabel.text = "配送至"
        playLabel.textColor = UIColor.black
        playLabel.backgroundColor = UIColor.clear
        playLabel.layer.borderColor = UIColor.black.cgColor
        playLabel.layer.borderWidth = 0.5
        playLabel.font = UIFont.systemFont(ofSize: 10)
        playLabel.sizeToFit()
        playLabel.textAlignment = NSTextAlignment.center
        playLabel.frame = CGRect(x: 0, y: (frame.size.height - playLabel.height - 2) * 0.5, width: playLabel.frame.size.width + 6, height: playLabel.frame.size.height + 2)
        addSubview(playLabel)
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.text = "穿金路36号"
        titleLabel.frame = CGRect(x: playLabel.frame.maxX + 4, y: 0, width: titleLabel.width, height: frame.height)
        addSubview(titleLabel)
        arrowImageView.frame = CGRect(x: titleLabel.frame.maxX + 4, y: (frame.size.height - 6) * 0.5, width: 10, height: 6)
        addSubview(arrowImageView)
        
        addressWidth = arrowImageView.frame.maxX
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ text: String) {
        let adressStr = text as NSString
        if adressStr.components(separatedBy: " ").count > 1 {
            titleLabel.text = adressStr.components(separatedBy: " ")[0]
        } else {
            titleLabel.text = adressStr as String
        }
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: playLabel.frame.maxX + 4, y: 0, width: titleLabel.width, height: frame.height)
        arrowImageView.frame = CGRect(x: titleLabel.frame.maxX + 4, y: (frame.size.height - arrowImageView.height) * 0.5, width: arrowImageView.width, height: arrowImageView.height)
        addressWidth = arrowImageView.frame.maxX
    }
    
}
