//
//  AnimationViewController.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/15.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class AnimationViewController: UIViewController {
    
    fileprivate var smallAnimationLayer: [CALayer]?
    fileprivate var bigAnimationLayer: [CALayer]?
    
    func addProductToSmallShopCarAnimation(_ imageView: UIImageView) {
        if smallAnimationLayer == nil {
            smallAnimationLayer = [CALayer]()
        }
        
        let frame = imageView.convert(imageView.bounds, to: view)
        let transitionLayer = CALayer()
        transitionLayer.frame = frame
        transitionLayer.contents = imageView.layer.contents
        view.layer.addSublayer(transitionLayer)
        smallAnimationLayer?.append(transitionLayer)
        
        let p1 = transitionLayer.position
        let p3 = CGPoint(x: view.width - view.width / 4 - view.width / 8 - 6, y: view.layer.bounds.size.height - 40)
        
        let positionAnimation = CAKeyframeAnimation(keyPath: "position")
        let path = CGMutablePath()
        CGPathMoveToPoint(path, nil, p1.x, p1.y)
        CGPathAddCurveToPoint(path, nil, p1.x, p1.y - 30, p3.x, p1.y - 30, p3.x, p3.y)
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.9
        opacityAnimation.fillMode = kCAFillModeForwards
        opacityAnimation.isRemovedOnCompletion = true
        
        let transformAnimation = CABasicAnimation(keyPath: "transform")
        transformAnimation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        transformAnimation.toValue = NSValue(caTransform3D: CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 1))
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [positionAnimation, opacityAnimation, transformAnimation]
        groupAnimation.duration = 0.8
        groupAnimation.delegate = self
        
        transitionLayer.add(groupAnimation, forKey: "smallShopCarAnimation")
    }
    
    func addProductToBigShopCarAnimation(_ imageView: UIImageView) {
        if bigAnimationLayer == nil {
            bigAnimationLayer = [CALayer]()
        }
        
        let frame = imageView.convert(imageView.bounds, to: view)
        let transitionLayer = CALayer()
        transitionLayer.frame = frame
        transitionLayer.contents = imageView.layer.contents
        view.layer.addSublayer(transitionLayer)
        bigAnimationLayer?.append(transitionLayer)
        
        let p1 = transitionLayer.position
        let p3 = CGPoint(x: view.width - 40, y: self.view.layer.bounds.size.height - 40);
        
        let positionAnimation = CAKeyframeAnimation(keyPath: "position")
        let path = CGMutablePath()
        CGPathMoveToPoint(path, nil, p1.x, p1.y)
        CGPathAddCurveToPoint(path, nil, p1.x, p1.y - 30, p3.x, p1.y - 30, p3.x, p3.y);
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.9
        opacityAnimation.fillMode = kCAFillModeForwards
        opacityAnimation.isRemovedOnCompletion = true
        
        let transformAnimation = CABasicAnimation(keyPath: "transform")
        transformAnimation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        transformAnimation.toValue = NSValue(caTransform3D: CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 1))
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [positionAnimation, opacityAnimation, transformAnimation]
        groupAnimation.duration = 0.8
        groupAnimation.delegate = self
        
        transitionLayer.add(groupAnimation, forKey: "bigShopCarAnimation")
    }
    
    override func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if smallAnimationLayer?.count > 0 {
            let transitionLayer = smallAnimationLayer![0]
            transitionLayer.isHidden = true
            transitionLayer.removeFromSuperlayer()
            smallAnimationLayer?.removeFirst()
            view.layer.removeAnimation(forKey: "smallShopCarAnimation")
        }
        if bigAnimationLayer?.count > 0 {
            let transitionLayer = bigAnimationLayer![0]
            transitionLayer.isHidden = true
            transitionLayer.removeFromSuperlayer()
            bigAnimationLayer?.removeFirst()
            view.layer.removeAnimation(forKey: "bigShopCarAnimation")
        }
    }
   
}
