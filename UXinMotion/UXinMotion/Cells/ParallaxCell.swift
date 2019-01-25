//
//  ParallaxCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class ParallaxCell: AnimationCell
{
    let view = UIView()
    let viewParallax = UIView()
    let floOriginY : CGFloat = 20
    let floParallaxOriginY : CGFloat = 10
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.setupViewWith(view: view, x: 20, y: floOriginY, w: appDLG.cellWidth - 40, h: appDLG.cellHeight - 40)
        view.backgroundColor = colorLayerDarker
        self.setupViewWith(view: viewParallax, x: 30, y: floParallaxOriginY, w: appDLG.cellWidth - 60, h: appDLG.cellHeight - 40)
    }
    
    override func eachAnimate()
    {
        UIView.animate(withDuration: timeDurationMove)
        {
            self.view.frame.origin.y = 24
            self.viewParallax.frame.origin.y = 30
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            UIView.animate(withDuration: timeDurationMove)
            {
                self.view.frame.origin.y = self.floOriginY
                self.viewParallax.frame.origin.y = self.floParallaxOriginY
            }
        }
    }
}
