//
//  NotSearchProductsView.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 3/28/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit

class NotSearchProductsView: UIView {
    
    fileprivate let topBackView = UIView()
    fileprivate let searchLabel = UILabel()
    fileprivate let markImageView = UIImageView()
    fileprivate let productLabel = UILabel()
    fileprivate let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        topBackView.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        topBackView.backgroundColor = UIColor.colorWithCustom(red: 249, gree: 242, blue: 216)
        addSubview(topBackView)
        
        markImageView.contentMode = UIViewContentMode.scaleAspectFill
        markImageView.image = UIImage(named: "icon_exclamationmark")
        markImageView.frame = CGRect(x: 15, y: (50 - 27) * 0.5, width: 27, height: 27)
        addSubview(markImageView)
        
        productLabel.textColor = UIColor.colorWithCustom(red: 148, gree: 107, blue: 81)
        productLabel.font = UIFont.systemFont(ofSize: 14)
        productLabel.frame = CGRect(x: markImageView.frame.maxX + 10, y: 10, width: width * 0.7, height: 15)
        productLabel.text = "暂时没搜到〝星巴克〞相关商品"
        addSubview(productLabel)
        
        searchLabel.textColor = UIColor.colorWithCustom(red: 252, gree: 185, blue: 47)
        searchLabel.font = UIFont.systemFont(ofSize: 12)
        searchLabel.text = "换其他关键词试试看,但是并没有什么卵用~"
        searchLabel.frame = CGRect(x: productLabel.x, y: productLabel.frame.maxY + 5, width: width * 0.7, height: 15)
        addSubview(searchLabel)
        
        titleLabel.textColor = UIColor.gray
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.text = "大家都在买"
        titleLabel.frame = CGRect(x: 10, y: 60, width: 200, height: 15)
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSearchProductLabelText(_ text: String) {
        productLabel.text = "暂时没搜到" + "〝" + text + "〞" + "相关商品"
    }

}
