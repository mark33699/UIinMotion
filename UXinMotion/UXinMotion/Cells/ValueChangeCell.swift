//
//  ValueChangeCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class ValueChangeCell: AnimationCell
{
    let labValueChange = UILabel()
    lazy var dispalyLink = CADisplayLink.init(target: self, selector: #selector(self.updateValue))
    var timeTotal : TimeInterval = 0
    var timeProgress : TimeInterval  = 0
    var timeLastUpdate : TimeInterval  = 0
    var intStart : Float = 0
    var intEnd : Float = 0
    var intCurrent : Float
    {
        if timeProgress >= timeTotal
        {
            return intEnd
        }
        else
        {
            return intStart + Float(timeProgress / timeTotal) * (intEnd - intStart)
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.labValueChange.frame = CGRect.init(x: 0, y: 0, width: appDLG.cellWidth, height: appDLG.cellHeight)
        self.labValueChange.text = "0"
        self.labValueChange.textColor = colorLayerLighter
        self.labValueChange.textAlignment = .center
        self.labValueChange.font = UIFont.boldSystemFont(ofSize: 66)
        self.contentView.addSubview(self.labValueChange)
    }
    
    override func eachAnimate()
    {
        self.count(from: 0, to: 10, duration: timeDurationMove)
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDurationStop)
        {
            self.count(from: 10, to: 0, duration: timeDurationMove)
        }
    }
    
    func count(from : Float, to : Float, duration : TimeInterval)
    {
        intStart = from
        intEnd = to
        timeTotal = duration
        timeProgress = 0
        timeLastUpdate = Date.timeIntervalSinceReferenceDate
        dispalyLink = CADisplayLink.init(target: self, selector: #selector(self.updateValue))
        dispalyLink.add(to: .main, forMode: .defaultRunLoopMode)
        dispalyLink.add(to: .main, forMode: .UITrackingRunLoopMode)
    }
    
    @objc func updateValue()
    {
        let now = NSDate.timeIntervalSinceReferenceDate
        self.timeProgress += now - timeLastUpdate
        self.timeLastUpdate = now
        
        if self.timeProgress >= self.timeTotal
        {
            self.dispalyLink.invalidate()
            self.timeProgress = self.timeTotal
        }
        else
        {
            labValueChange.text = String(format: "%.0f", self.intCurrent)
        }
    }
}
