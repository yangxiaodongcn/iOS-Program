//
//  GuideViewController.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/11.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class GuideViewController: BaseViewController {
    
    private var collectionView: GuideCollectionView?
    private var pageControl: UIPageControl?
    private var imageNames = ["guide_40_1", "guide_40_2", "guide_40_3", "guide_40_4"]
    private let cellIdentifier = "GuideCell"
    private let frameBounds = ScreenBounds
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.None)
        
        buildCollectionView()
        buildPageControl()
    }
    
    private func buildPageControl() {
        pageControl = UIPageControl(frame: CGRectMake(0, ScreenHeight - 50, ScreenWidth, 20))
        pageControl!.numberOfPages = imageNames.count
        pageControl!.currentPage = 0
        view.addSubview(pageControl!)
    }
    
    private func buildCollectionView() {
        collectionView = GuideCollectionView(frame: frameBounds, identifier: cellIdentifier)
        collectionView!.delegate = self
        collectionView!.dataSource = self
        view.addSubview(collectionView!)
    }
}

extension GuideViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! GuideCollectionViewCell
        
        cell.image = UIImage(named: imageNames[indexPath.row])
        if indexPath.row != imageNames.count-1 {
            cell.nextButtonHidden = true
        } else {
            cell.nextButtonHidden = false
        }
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x / ScreenWidth + 0.5)
    }
}