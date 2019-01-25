//
//  CloningCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class CloningCell: AnimationCell
{
    let viewClone1 = UIView()
    let viewClone2 = UIView()
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.setupCircleView(view: self.viewClone1)
        self.setupCircleView(view: self.viewClone2)
    }
    
    func setupCircleView(view : UIView)
    {
        view.frame = CGRect.init(x: 0, y: 0, width: appDLG.cellHeight / 2, height: appDLG.cellHeight / 2)
        view.center = CGPoint.init(x: appDLG.cellWidth / 2, y: appDLG.cellHeight / 2)
        view.backgroundColor = colorLayerLighter
        view.layer.masksToBounds = true
        view.layer.cornerRadius = appDLG.cellHeight / 4
        self.contentView.addSubview(view)
    }
    
    override func eachAnimate()
    {
        animateVeiw(view: self.viewClone1, x: appDLG.cellWidth / 4)
        animateVeiw(view: self.viewClone2, x: appDLG.cellWidth / 4 * 3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            self.animateVeiw(view: self.viewClone1, x: appDLG.cellWidth / 2)
            self.animateVeiw(view: self.viewClone2, x: appDLG.cellWidth / 2)
        }
    }
    
    func animateVeiw(view : UIView, x : CGFloat)
    {
        UIView.transition(with: view, duration: timeDurationMove, options: .curveLinear, animations:
            {
                view.center = CGPoint.init(x: x, y: appDLG.cellHeight / 2)
        })
    }
}
