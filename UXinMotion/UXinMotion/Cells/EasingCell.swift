//
//  EasingCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/12.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class EasingCell : AnimationCell
{
    let viewEasing = UIView()
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.floViewWidth = appDLG.cellHeight / 2
        self.floViewHeight = self.floViewWidth
        self.setupViewWith(view: self.viewEasing, y: appDLG.cellHeight / 4)
    }
    
    override func eachAnimate()
    {
        self.viewEasing.frame.origin.x = 0 - floViewWidth
        
        UIView.transition(with: self.viewEasing, duration: timeDurationMove, options: .curveEaseInOut, animations:
        {
            self.viewEasing.center = self.center
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            UIView.transition(with: self.viewEasing, duration: timeDurationMove, options: .curveEaseInOut, animations:
            {
                self.viewEasing.frame.origin.x = self.frame.size.width
            })
        }
    }
}
