//
//  MaskingCell.swift
//  UXinMotion
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import Foundation
import UIKit

class MaskingCell: TransformationCell
{
    let viewMasked = UIView()
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        viewMasked.frame = self.newFrame
        viewMasked.backgroundColor = colorLayerDarker
        self.contentView.addSubview(viewMasked)
        self.contentView.bringSubview(toFront: self.viewTransformation)
    }
}
