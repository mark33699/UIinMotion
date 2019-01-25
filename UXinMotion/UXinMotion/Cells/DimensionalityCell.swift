//
//  DimensionalityCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class DimensionalityCell: AnimationCell
{
    let viewDimensionality = UIView()
    let floOriginHeight : CGFloat = appDLG.cellHeight / 2 - 20
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupViewWith(view: viewDimensionality, x: 20, y: 20, w: appDLG.cellWidth - 40, h: floOriginHeight)
    }
    
    override func eachAnimate()
    {
        UIView.transition(with: self.viewDimensionality, duration: timeDurationMove, options: .transitionFlipFromBottom, animations:
            {
                self.viewDimensionality.backgroundColor = UIColor.black
                self.viewDimensionality.frame.size.height = 0
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            UIView.transition(with: self.viewDimensionality, duration: timeDurationMove, options: .transitionFlipFromTop, animations:
                {
                    self.viewDimensionality.backgroundColor = colorLayerLighter
                    self.viewDimensionality.frame.size.height = self.floOriginHeight
            })
        }
    }
}
