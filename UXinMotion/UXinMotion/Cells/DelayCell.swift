//
//  DelayCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/13.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class DelayCell: AnimationCell
{
    let viewDelay1 = UIView()
    let viewDelay2 = UIView()
    let viewDelay3 = UIView()
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        floViewWidth = appDLG.cellWidth / 2
        floViewHeight = appDLG.cellHeight / 9
        self.setupViewWith(view: self.viewDelay1, y: appDLG.cellHeight / 9 * 3 + 2)
        self.setupViewWith(view: self.viewDelay2, y: appDLG.cellHeight / 9 * 4 + 4)
        self.setupViewWith(view: self.viewDelay3, y: appDLG.cellHeight / 9 * 5 + 6)
    }
    
    override func eachAnimate()
    {
        self.viewAnimate(theView: viewDelay1, animationOptions: .curveLinear)
        self.viewAnimate(theView: viewDelay2, animationOptions: .curveLinear)
        self.viewAnimate(theView: viewDelay3, animationOptions: .curveEaseIn)
    }
    
    func viewAnimate(theView : UIView,
                     animationOptions : UIViewAnimationOptions)
    {
        theView.frame.origin.x = 0 - floViewWidth
        
        UIView.transition(with: theView, duration: timeDurationMove, options: animationOptions, animations:
        {
            theView.frame.origin.x = self.frame.size.width / 4
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            UIView.transition(with: theView, duration: timeDurationMove, options: animationOptions, animations:
            {
                theView.frame.origin.x = self.frame.size.width
            })
        }
    }
}
