//
//  WCLNavanimation.swift
//  WCLNavigationController
//
//  Created by wcl on 15/12/6.
//  Copyright © 2015年 W_C__L. All rights reserved.
//

import UIKit

class WCLNavanimation: NSObject,UIViewControllerAnimatedTransitioning {
    
    var isPush:Bool = true
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC:UIViewController! = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC:UIViewController! = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let frame:CGRect = UIScreen.mainScreen().bounds
        transitionContext.containerView()?.addSubview(toVC.view)
        if self.isPush
        {
            toVC.view.frame = frame
            toVC.view.frame = CGRectOffset(frame, frame.size.width, 0)
            transitionContext.containerView()!.bringSubviewToFront(toVC.view)
        }else
        {
            let tranfScale:CGAffineTransform = CGAffineTransformIdentity
            toVC.view.transform = CGAffineTransformScale(tranfScale, 0.9, 0.9)
            transitionContext.containerView()!.bringSubviewToFront(fromVC.view)
        }
        UIView.animateWithDuration(0.35, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            if self.isPush
            {
                toVC.view.frame = (toVC?.view.bounds)!
                let tranfScale:CGAffineTransform = CGAffineTransformIdentity
                fromVC?.view.transform = CGAffineTransformScale(tranfScale, 0.9, 0.9)
            }else
            {
                let tranfScale:CGAffineTransform = CGAffineTransformIdentity
                toVC?.view.transform = CGAffineTransformScale(tranfScale, 1, 1)
                fromVC.view.frame = CGRectOffset(fromVC.view.frame, toVC.view.frame.size.width, 0)
            }
            }) { (isCompelete) -> Void in
                if self.isPush
                {
                    transitionContext.completeTransition(true)
                }else{
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled());
                }
        }
    }

}
