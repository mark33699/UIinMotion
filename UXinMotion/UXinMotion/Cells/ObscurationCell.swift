//
//  ObscurationCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class ObscurationCell: AnimationCell
{
    let imgv = UIImageView.init(image: UIImage.init(named: "200"))
    let viewObscuration = UIVisualEffectView.init(effect: UIBlurEffect.init(style: .light))
    let floViewSize = appDLG.cellHeight / 10 * 8
    var floBlurWidth : CGFloat
    {
        return self.floViewSize / 3 * 2
    }
    var floOriginX : CGFloat
    {
        return -(floBlurWidth - floViewSize / 2)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.setupViewWith(view: imgv,
                           x: appDLG.cellWidth / 2 - floViewSize / 2,
                           y: appDLG.cellHeight / 2 - floViewSize / 2,
                           w: floViewSize,
                           h: floViewSize)
        viewObscuration.frame = CGRect.init(x: floOriginX,
                                            y: 0,
                                            width: self.floViewSize / 3 * 2,
                                            height: self.floViewSize)
        viewObscuration.alpha = 0.95
        self.imgv.addSubview(viewObscuration)
    }
    
    override func eachAnimate()
    {
        UIView.transition(with: self.viewObscuration, duration: timeDurationMove, options: .curveEaseInOut, animations:
            {
                self.viewObscuration.frame.origin.x = self.floViewSize / 2
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            UIView.transition(with: self.viewObscuration, duration: timeDurationMove, options: .curveEaseInOut, animations:
                {
                    self.viewObscuration.frame.origin.x = self.floOriginX
            })
        }
    }
}
