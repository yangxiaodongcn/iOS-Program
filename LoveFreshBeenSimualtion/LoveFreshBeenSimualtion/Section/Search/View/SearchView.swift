//
//  SearchView.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 3/28/16.
//  Copyright © 2016 杨晓冬. All rights reserved.
//

import UIKit

class SearchView: UIView {

    fileprivate let searchLabel = UILabel()
    fileprivate var lastX: CGFloat = 0
    fileprivate var lastY: CGFloat = 35
    fileprivate var searchButtonClickCallback: ((_ sender: UIButton) -> ())?
    var searchHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        searchLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width - 30, height: 35)
        searchLabel.font = UIFont.systemFont(ofSize: 15)
        searchLabel.textColor = UIColor.colorWithCustom(red: 140, gree: 140, blue: 140)
        addSubview(searchLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, searchTitleText: String, searchButtonTitleTexts: [String], searchButtonClickCallback:@escaping ((_ sender: UIButton) -> ())) {
        self.init(frame: frame)
        
        var btnW: CGFloat = 0
        let btnH: CGFloat = 30
        let addW: CGFloat = 30
        let marginX: CGFloat = 10
        let marginY: CGFloat = 10
        
        searchLabel.text = searchTitleText
        
        for i in 0..<searchButtonTitleTexts.count {
            let btn = UIButton()
            btn.setTitle(searchButtonTitleTexts[i], for: UIControlState())
            btn.setTitleColor(UIColor.black, for: UIControlState())
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.titleLabel?.sizeToFit()
            btn.backgroundColor = UIColor.white
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 15
            btn.layer.borderWidth = 0.5
            btn.layer.borderColor = UIColor.colorWithCustom(red: 200, gree: 200, blue: 200).cgColor
            btn.addTarget(self, action: #selector(SearchView.searchButtonClick(_:)), for: UIControlEvents.touchUpInside)
            btnW = btn.titleLabel!.width + addW
            
            if frame.width - lastX > btnW {
                btn.frame = CGRect(x: lastX, y: lastY, width: btnW, height: btnH)
            } else {
                btn.frame = CGRect(x: 0, y: lastY + marginY + btnH, width: btnW, height: btnH)
            }
            
            lastX = btn.frame.maxX + marginX
            lastY = btn.y
            searchHeight = btn.frame.maxY
            
            addSubview(btn)
        }
        self.searchButtonClickCallback = searchButtonClickCallback
    }
    
    func searchButtonClick(_ sender: UIButton) {
        if searchButtonClickCallback != nil {
            searchButtonClickCallback!(sender)
        }
    }
}
