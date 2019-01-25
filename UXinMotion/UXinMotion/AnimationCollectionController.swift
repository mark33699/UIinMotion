//
//  AnimationCollectionController.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/12.
//  Copyright © 2018年 Admin. All rights reserved.
//

import UIKit

class AnimationCollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var switchControl: UISwitch!
    let transitionManager = MenuTransitionManager()
    var onAnimate = false;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.black
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return AnimationCellSeq.getCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let strIdentifier = AnimationCellSeq.init(rawValue: indexPath.row)?.name ?? "ZoomCell"
        let animationCell = collectionView.dequeueReusableCell(withReuseIdentifier: strIdentifier, for: indexPath) as! AnimationCell
        if onAnimate
        {
            animationCell.cellAnimate()
        }
        else
        {
            animationCell.stopAnimate()
        }
        return animationCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize.init(width: appDLG.cellWidth,
                           height: appDLG.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    @IBAction func toggleAnimate(_ sender: UISwitch)
    {
        onAnimate = sender.isOn
        self.collectionView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        transitionManager.fromVC = self
        segue.destination.transitioningDelegate = transitionManager
        if let switchControl = switchControl
        {
            switchControl.isOn = false
            toggleAnimate(switchControl)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

