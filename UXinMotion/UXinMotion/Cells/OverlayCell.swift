//
//  OverlayCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class OverlayCell: AnimationCell
{
    let view = UIView()
    let viewOverlay = UIView()
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.floViewX = appDLG.cellWidth / 4
        self.floViewWidth = appDLG.cellHeight / 2
        self.floViewHeight = appDLG.cellHeight / 2
        
        self.setupViewWith(view: view, y: appDLG.cellHeight / 4)
        view.backgroundColor = colorLayerDarker
        self.setupViewWith(view: viewOverlay, y: appDLG.cellHeight / 4)
    }
    
    override func eachAnimate()
    {
        UIView.transition(with: self.view, duration: timeDurationMove, options: .curveLinear, animations:
            {
                self.viewOverlay.frame.origin.x = appDLG.cellWidth / 2
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            UIView.transition(with: self.view, duration: timeDurationMove, options: .curveLinear, animations:
                {
                    self.viewOverlay.frame.origin.x = appDLG.cellWidth / 4
            })
        }
    }
}
