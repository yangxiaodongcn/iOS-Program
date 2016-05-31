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
    private func buildNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.barButton("扫一扫", titleColor: UIColor.blackColor(), image: UIImage(named: "icon_black_scancode")!, highLightImage: nil, target: self, action: "leftItemClick", type: ItemButtonType.Left)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.barButton("搜 索", titleColor: UIColor.blackColor(),
            image: UIImage(named: "icon_search")!,highLightImage: nil,
            target: self, action: "rightItemClick", type: ItemButtonType.Right)
        
        let titleView = AddressTitleView(frame: CGRectMake(0, 0, 0, 30))
        titleView.frame = CGRectMake(0, 0, titleView.addressWidth, 30)
        navigationItem.titleView = titleView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "titleViewClick")
        navigationItem.titleView?.addGestureRecognizer(tapGesture)
    }
    
    func leftItemClick() {
        
    }
    
    func rightItemClick() {
        
    }
    
    func titleViewClick() {
        
    }
}
