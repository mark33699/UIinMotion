//
//  AnimationCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/12.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

/** 預設*/
let colorLayerLighter = UIColor.init(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
let colorLayerDarker = UIColor.init(red: 195/255, green: 195/255, blue: 195/255, alpha: 1)
let timeDurationStop : TimeInterval = 1
let timeDurationMove : TimeInterval = 0.5

enum AnimationCellSeq : Int 
{
    case EasingCell
    case DelayCell
    case ParentingCell
    case TransformationCell
    case ValueChangeCell
    case MaskingCell
    case OverlayCell
    case CloningCell
    case ObscurationCell
    case ParallaxCell
    case DimensionalityCell
    case ZoomCell
    
    var name : String
    {
        return "\(self)"
    }
    
    static func getCount() -> Int
    {
        return AnimationCellSeq.ZoomCell.rawValue + 1
    }
}

class AnimationCell: UICollectionViewCell
{
    var timerAnimate = Timer.init()
    var floViewX : CGFloat = 0
    var floViewWidth : CGFloat = 0
    var floViewHeight : CGFloat = 0
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 1
        self.layer.borderColor = colorLayerLighter.cgColor
    }
    
    /** 用於該Cell會有多個view長寬跟x軸都相同, 使用前先設定self參數長寬跟x軸  */
    func setupViewWith(view : UIView, y : CGFloat)
    {
        view.frame = CGRect.init(x: floViewX, y: y, width: floViewWidth, height: floViewHeight)
        view.backgroundColor = colorLayerLighter
        self.contentView.addSubview(view)
    }
    
    func setupViewWith(view : UIView, x : CGFloat, y : CGFloat, w : CGFloat, h : CGFloat)
    {
        view.frame = CGRect.init(x: x, y: y, width: w, height: h)
        view.backgroundColor = colorLayerLighter
        self.contentView.addSubview(view)
    }
    
    func cellAnimate()
    {
        timerAnimate = Timer.scheduledTimer(withTimeInterval: 2, repeats: true)
        { (timer) in
            
            self.eachAnimate()
        }
    }
    
    func stopAnimate()
    {
        timerAnimate.invalidate()
    }
    
    func eachAnimate()
    {
        //for override
    }
}
