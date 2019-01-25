//
//  MenuViewController.swift
//  UXinMotion
//
//  Created by Admin on 2019/1/19.
//  Copyright © 2019年 Admin. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UICollectionViewController
{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 99
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        switch indexPath.row % 3
        {
            case 0:
                return collectionView.dequeueReusableCell(withReuseIdentifier: "cellRed", for: indexPath)
            case 1:
                return collectionView.dequeueReusableCell(withReuseIdentifier: "cellYellow", for: indexPath)
            default:
                return collectionView.dequeueReusableCell(withReuseIdentifier: "cellGreen", for: indexPath)
        }
    }
}
