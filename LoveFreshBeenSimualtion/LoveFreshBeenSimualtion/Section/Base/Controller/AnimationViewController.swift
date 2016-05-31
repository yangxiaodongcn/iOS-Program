//
//  AnimationViewController.swift
//  LoveFreshBeenSimualtion
//
//  Created by 杨晓冬 on 16/3/15.
//  Copyright © 2016年 杨晓冬. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    private var smallAnimationLayer: [CALayer]?
    private var bigAnimationLayer: [CALayer]?
    
    func addProductToSmallShopCarAnimation(imageView: UIImageView) {
        if smallAnimationLayer == nil {
            smallAnimationLayer = [CALayer]()
        }
        
        let frame = imageView.convertRect(imageView.bounds, toView: view)
        let transitionLayer = CALayer()
        transitionLayer.frame = frame
        transitionLayer.contents = imageView.layer.contents
        view.layer.addSublayer(transitionLayer)
        smallAnimationLayer?.append(transitionLayer)
        
        let p1 = transitionLayer.position
        let p3 = CGPointMake(view.width - view.width / 4 - view.width / 8 - 6, view.layer.bounds.size.height - 40)
        
        let positionAnimation = CAKeyframeAnimation(keyPath: "position")
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, p1.x, p1.y)
        CGPathAddCurveToPoint(path, nil, p1.x, p1.y - 30, p3.x, p1.y - 30, p3.x, p3.y)
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.9
        opacityAnimation.fillMode = kCAFillModeForwards
        opacityAnimation.removedOnCompletion = true
        
        let transformAnimation = CABasicAnimation(keyPath: "transform")
        transformAnimation.fromValue = NSValue(CATransform3D: CATransform3DIdentity)
        transformAnimation.toValue = NSValue(CATransform3D: CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 1))
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [positionAnimation, opacityAnimation, transformAnimation]
        groupAnimation.duration = 0.8
        groupAnimation.delegate = self
        
        transitionLayer.addAnimation(groupAnimation, forKey: "smallShopCarAnimation")
    }
    
    func addProductToBigShopCarAnimation(imageView: UIImageView) {
        if bigAnimationLayer == nil {
            bigAnimationLayer = [CALayer]()
        }
        
        let frame = imageView.convertRect(imageView.bounds, toView: view)
        let transitionLayer = CALayer()
        transitionLayer.frame = frame
        transitionLayer.contents = imageView.layer.contents
        view.layer.addSublayer(transitionLayer)
        bigAnimationLayer?.append(transitionLayer)
        
        let p1 = transitionLayer.position
        let p3 = CGPointMake(view.width - 40, self.view.layer.bounds.size.height - 40);
        
        let positionAnimation = CAKeyframeAnimation(keyPath: "position")
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, p1.x, p1.y)
        CGPathAddCurveToPoint(path, nil, p1.x, p1.y - 30, p3.x, p1.y - 30, p3.x, p3.y);
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.9
        opacityAnimation.fillMode = kCAFillModeForwards
        opacityAnimation.removedOnCompletion = true
        
        let transformAnimation = CABasicAnimation(keyPath: "transform")
        transformAnimation.fromValue = NSValue(CATransform3D: CATransform3DIdentity)
        transformAnimation.toValue = NSValue(CATransform3D: CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 1))
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [positionAnimation, opacityAnimation, transformAnimation]
        groupAnimation.duration = 0.8
        groupAnimation.delegate = self
        
        transitionLayer.addAnimation(groupAnimation, forKey: "bigShopCarAnimation")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if smallAnimationLayer?.count > 0 {
            let transitionLayer = smallAnimationLayer![0]
            transitionLayer.hidden = true
            transitionLayer.removeFromSuperlayer()
            smallAnimationLayer?.removeFirst()
            view.layer.removeAnimationForKey("smallShopCarAnimation")
        }
        if bigAnimationLayer?.count > 0 {
            let transitionLayer = bigAnimationLayer![0]
            transitionLayer.hidden = true
            transitionLayer.removeFromSuperlayer()
            bigAnimationLayer?.removeFirst()
            view.layer.removeAnimationForKey("bigShopCarAnimation")
        }
    }
   
}
