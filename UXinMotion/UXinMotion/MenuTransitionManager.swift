//
//  MenuTransitionManager.swift
//  UXinMotion
//
//  Created by Admin on 2019/1/19.
//  Copyright © 2019年 Admin. All rights reserved.
//

import Foundation
import UIKit

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate
{
    var fromVC : UIViewController?
    var duration = 0.5
    var isPresenting = false
    var snapshot:UIView?
    {
        didSet
        {
            let tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(dismiss))
            snapshot?.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        return duration
    }
    
    @objc func dismiss()
    {
        fromVC?.dismiss(animated: true, completion: nil)
    }
    
    //MARK: UIViewControllerAnimatedTransitioning
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)
        let container = transitionContext.containerView
        let moveDown = CGAffineTransform.init(translationX: 0, y: container.frame.height - 400)
        let moveUp = CGAffineTransform.init(translationX: 0, y: -50)
        if isPresenting
        {
            toView?.transform = moveUp
            snapshot = fromView?.snapshotView(afterScreenUpdates: true)
            container.addSubview(toView!)
            container.addSubview(snapshot!)
        }
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveLinear, animations:
            {
                if self.isPresenting
                {
                    self.snapshot?.transform = moveDown
                    toView?.transform = CGAffineTransform.identity
                }
                else
                {
                    self.snapshot?.transform = CGAffineTransform.identity
                    fromView?.transform = moveUp
                }
        })
        { (isFinish) in
            
            transitionContext.completeTransition(true)
            if !self.isPresenting
            {
                self.snapshot?.removeFromSuperview()
            }
        }
    }

    //MARK: UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresenting = true
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresenting = false
        return self
    }
}
