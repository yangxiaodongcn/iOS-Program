//
//  SelectedAdressViewController.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/15.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class SelectedAdressViewController: AnimationViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Build UI
    fileprivate func buildNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.barButton("扫一扫", titleColor: UIColor.black, image: UIImage(named: "icon_black_scancode")!, highLightImage: nil, target: self, action: "leftItemClick", type: ItemButtonType.left)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.barButton("搜 索", titleColor: UIColor.black,
            image: UIImage(named: "icon_search")!,highLightImage: nil,
            target: self, action: "rightItemClick", type: ItemButtonType.right)
        
        let titleView = AddressTitleView(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
        titleView.frame = CGRect(x: 0, y: 0, width: titleView.addressWidth, height: 30)
        navigationItem.titleView = titleView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SelectedAdressViewController.titleViewClick))
        navigationItem.titleView?.addGestureRecognizer(tapGesture)
    }
    
    func leftItemClick() {
        
    }
    
    func rightItemClick() {
        
    }
    
    func titleViewClick() {
        
    }
}
