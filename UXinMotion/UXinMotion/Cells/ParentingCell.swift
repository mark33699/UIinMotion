//
//  ParentingCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class ParentingCell: AnimationCell
{
    let viewParent = UIView()
    let viewChild = UIView()
    
    let floEdgeSpace : CGFloat = 10
    let floBetweenSpace : CGFloat = 10
    
    var originFrom = CGPoint.zero
    var originTo = CGPoint.zero
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        floViewX = 10
        floViewWidth = appDLG.cellWidth / 2 - floEdgeSpace
        floViewHeight = appDLG.cellHeight / 2 - 15
        self.viewChild.layer.anchorPoint = CGPoint.init(x: 0, y: 0)
        self.setupViewWith(view: self.viewChild, y:floEdgeSpace)
        self.setupViewWith(view: self.viewParent, y:floEdgeSpace + floViewHeight + floBetweenSpace)
        let floNewWidth = floViewWidth * 0.3
        let floNewHeight = floViewHeight * 0.3
        originFrom = self.viewChild.frame.origin
        originTo = CGPoint.init(x: appDLG.cellWidth / 4 * 3 - floNewWidth / 2,
                                y: appDLG.cellHeight / 2 - floBetweenSpace / 2 - floNewHeight)
    }
    
    override func eachAnimate()
    {
        UIView.animate(withDuration: 0.5)
        {
            self.viewParent.frame.origin.x = self.center.x
            self.viewChild.frame.origin = self.originTo
            self.viewChild.transform = CGAffineTransform.init(scaleX: 0.3, y: 0.3)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            UIView.animate(withDuration: timeDurationMove)
            {
                self.viewParent.frame.origin.x = self.floViewX
                self.viewChild.frame.origin = self.originFrom
                self.viewChild.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }
        }
    }
}
