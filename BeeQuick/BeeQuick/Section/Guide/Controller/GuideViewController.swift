//
//  GuideViewController.swift
//  LoveFreshBeen
//
//  Created by 杨晓冬 on 4/20/16.
//  Copyright © 2016 YangXiaodong. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var enterAppButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let images = GuideModel.instance.images {
            pageControl.currentPage = 0
            pageControl.numberOfPages = images.count
            
            for i in 0...images.count - 1 {
                let imageView = UIImageView(frame: UIScreen.mainScreen().bounds)
                imageView.frame = CGRectMake(ScreenWidth * CGFloat(i), 0, ScreenWidth, ScreenHeight)
                imageView.image = images[i]
                scrollView.addSubview(imageView)
            }
            scrollView.delegate = self
            scrollView.contentSize = CGSizeMake(ScreenWidth * CGFloat(images.count), ScreenHeight)
            
            enterAppButton.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enterAppButtonClick(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName(GuideViewControllerDidFinish, object: nil)
    }
    
    @IBAction func pageControlClick(sender: UIPageControl) {
        scrollView.scrollRectToVisible(CGRectMake(ScreenWidth*CGFloat(sender.currentPage), 0, ScreenWidth, ScreenHeight), animated: true)
    }
}

extension GuideViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let index = fabs(scrollView.contentOffset.x / ScreenWidth)
        pageControl.currentPage = Int(index)
        if Int(index) + 1 == GuideModel.instance.images?.count {
            enterAppButton.hidden = false
        } else {
            enterAppButton.hidden = true
        }
    }
}