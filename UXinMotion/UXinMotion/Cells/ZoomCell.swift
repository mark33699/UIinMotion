//
//  ZoomCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class ZoomCell: AnimationCell
{
    //一行或一列給三個view分
    let floWidth = appDLG.cellWidth / 10 * 3
    let floHeight = appDLG.cellHeight / 10 * 3
    //三個view有兩個間隔
    let floWidthSpace = appDLG.cellWidth / 10 / 2
    let floHeightSpace = appDLG.cellHeight / 10 / 2
    var floX : CGFloat = 0
    var floY : CGFloat = 0
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        for num : Int in 0...8
        {
            let viewZoom = UIView()
            viewZoom.layer.anchorPoint = CGPoint.init(x: floX * 0.5, y: floY * 0.5)
            viewZoom.tag = num
            setupViewWith(view: viewZoom,
                          x: floX * (floWidth + floWidthSpace),
                          y: floY * (floHeight + floHeightSpace),
                          w: floWidth,
                          h: floHeight)
            if floX == 2{
                floX = 0
                floY += 1
            }else{
                floX += 1
            }
        }
    }
    
    override func eachAnimate()
    {
        UIView.animate(withDuration: timeDurationMove)
        {
            for num : Int in 0...8
            {
                let viewZoom = self.contentView.subviews.filter({$0.tag == num}).first ?? UIView()
                let floBigScale : CGFloat = 3.333333
                let floSmallScale : CGFloat = 0.000001 //直接給零的話就會沒動畫
                
                if num == 4
                {
                    //如果直接指定size的話, 一定是從左上角放大縮小
                    viewZoom.transform = CGAffineTransform.init(scaleX: floBigScale, y: floBigScale)
                }
                else if num == 1 || num == 7
                {
                    viewZoom.transform = CGAffineTransform.init(scaleX: floBigScale, y: floSmallScale)
                }
                else if num == 3 || num == 5
                {
                    viewZoom.transform = CGAffineTransform.init(scaleX: floSmallScale, y: floBigScale)
                }
                else
                {
                    viewZoom.transform = CGAffineTransform.init(scaleX: floSmallScale, y: floSmallScale)
                }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            UIView.animate(withDuration: timeDurationMove)
            {
                for viewZoom : UIView in self.contentView.subviews
                {
                    viewZoom.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                }
            }
        }
    }
}
