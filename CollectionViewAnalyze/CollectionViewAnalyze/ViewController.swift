//
//  ViewController.swift
//  CollectionViewAnalyze
//
//  Created by 杨晓冬 on 4/29/16.
//  Copyright © 2016 YangXiaodong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view = UIView(frame: CGRectMake(0,-200,self.view!.bounds.width,200))
        view.backgroundColor = UIColor.redColor()
        collectionView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)
        collectionView.addSubview(view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellIdentity", forIndexPath: indexPath)
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
}


