//
//  GuideViewController.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/11.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class GuideViewController: BaseViewController {
    
    fileprivate var collectionView: GuideCollectionView?
    fileprivate var pageControl: UIPageControl?
    fileprivate var imageNames = ["guide_40_1", "guide_40_2", "guide_40_3", "guide_40_4"]
    fileprivate let cellIdentifier = "GuideCell"
    fileprivate let frameBounds = ScreenBounds
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.setStatusBarHidden(false, with: UIStatusBarAnimation.none)
        
        buildCollectionView()
        buildPageControl()
    }
    
    fileprivate func buildPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: ScreenHeight - 50, width: ScreenWidth, height: 20))
        pageControl!.numberOfPages = imageNames.count
        pageControl!.currentPage = 0
        view.addSubview(pageControl!)
    }
    
    fileprivate func buildCollectionView() {
        collectionView = GuideCollectionView(frame: frameBounds, identifier: cellIdentifier)
        collectionView!.delegate = self
        collectionView!.dataSource = self
        view.addSubview(collectionView!)
    }
}

extension GuideViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GuideCollectionViewCell
        
        cell.image = UIImage(named: imageNames[(indexPath as NSIndexPath).row])
        if (indexPath as NSIndexPath).row != imageNames.count-1 {
            cell.nextButtonHidden = true
        } else {
            cell.nextButtonHidden = false
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x / ScreenWidth + 0.5)
    }
}
