//
//  TransformationCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class TransformationCell: AnimationCell
{
    let viewTransformation = UIView()
    var floCornerRadius : CGFloat = 0
    var originFrame : CGRect = CGRect.zero
    var newFrame : CGRect = CGRect.zero
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.floViewWidth = appDLG.cellHeight / 5
        self.floViewHeight = appDLG.cellHeight / 5
        self.floViewX = appDLG.cellWidth / 2 - floViewWidth / 2
        self.floCornerRadius = floViewHeight / 2
        self.viewTransformation.layer.cornerRadius = self.floCornerRadius
        self.viewTransformation.layer.masksToBounds = true
        self.setupViewWith(view: self.viewTransformation, y: appDLG.cellHeight / 2 - floViewHeight / 2)
        self.originFrame = self.viewTransformation.frame
        self.newFrame = CGRect.init(x: 20, y:20, width: appDLG.cellWidth - 40, height: appDLG.cellHeight - 40)
    }
    
    override func eachAnimate()
    {
        UIView.animate(withDuration: timeDurationMove)
        {
            self.viewTransformation.layer.cornerRadius = 0
            self.viewTransformation.frame = self.newFrame
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            UIView.animate(withDuration: timeDurationMove)
            {
                self.viewTransformation.layer.cornerRadius = self.floCornerRadius
                self.viewTransformation.frame = self.originFrame
            }
        }
    }
}
