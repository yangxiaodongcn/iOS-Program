//
//  GuideCollectionView.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/11.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class GuideCollectionView: UICollectionView {
    
    init(frame: CGRect, identifier: String) {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = frame.size
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        isPagingEnabled = true
        bounces = false
        register(GuideCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
