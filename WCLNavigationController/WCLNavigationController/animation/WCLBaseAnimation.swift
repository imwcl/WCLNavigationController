//
//  WCLBaseAnimation.swift
//  WCLNavigationController
//
//  Created by wcl on 15/12/16.
//  Copyright © 2015年 W_C__L. All rights reserved.
//

import UIKit

class WCLBaseAnimation: UIPercentDrivenInteractiveTransition,UIViewControllerAnimatedTransitioning {
    
    var animationDuration:NSTimeInterval = 0.3
    var isPush:Bool = true
    var interacting:Bool?
    var shouldComplete:Bool?
    var containerVC:UIViewController?
    var fromVC:UIViewController?
    var toVC:UIViewController?
    let ViewFrame = UIScreen.mainScreen().bounds
    
    required init(let containerVC:UIViewController) {
        self.containerVC = containerVC
    }
    
    /**
     设置push之前vc的view的状态
     */
    func pushBefore(){
        
    }
    
    /**
     设置pop之前vc的状态
     */
    func popBefore(){
        
    }
    
    /**
     设置push动画内容
     */
    func pushAnimation(){
        
    }
    
    /**
     设置pop的动画内容
     */
    func popAnimation(){
        
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return animationDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        if self.isPush
        {
            self.fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
            self.toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        }else
        {
            self.toVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
            self.fromVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        }
        if self.isPush
        {
            transitionContext.containerView()?.addSubview(self.toVC!.view)
            self.prepareGestureRecognizerInView(toVC!.view)
            transitionContext.containerView()!.bringSubviewToFront(self.toVC!.view)
            self.pushBefore()
        }else
        {
            transitionContext.containerView()?.addSubview(self.fromVC!.view)
            self.popBefore()
            transitionContext.containerView()!.bringSubviewToFront(self.toVC!.view)
        }
        UIView.animateWithDuration(animationDuration, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            if self.isPush
            {
                self.pushAnimation()
            }else
            {
                self.popAnimation()
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
    
    func prepareGestureRecognizerInView(let view:UIView){
        let page = UIScreenEdgePanGestureRecognizer.init(target: self, action: "handlePopRecognizer:")
        page.edges = UIRectEdge.Left
        view.addGestureRecognizer(page)
    }
    
    func handlePopRecognizer(gestureRecognizer:UISwipeGestureRecognizer){
        let translation = gestureRecognizer.locationInView(gestureRecognizer.view?.superview)
        switch gestureRecognizer.state
        {
        case .Began:
            self.interacting = true
            if self.containerVC is UINavigationController
            {
                (self.containerVC as! UINavigationController).popViewControllerAnimated(true)
            }else
            {
                self.containerVC?.dismissViewControllerAnimated(true, completion: nil)
            }
            break
        case .Changed:
            var fraction:CGFloat = translation.x / (UIApplication.sharedApplication().keyWindow?.frame.size.width)!;
            fraction = CGFloat(fminf(fmaxf(Float(fraction), 0.0), 1.0));
            self.shouldComplete = (fraction > 0.3);
            self.updateInteractiveTransition(fraction)
            break
        case .Cancelled , .Ended:
            self.interacting = false
            if (self.shouldComplete == false || (gestureRecognizer.state == UIGestureRecognizerState.Cancelled))
            {
                self.cancelInteractiveTransition()
            }else
            {
                self.finishInteractiveTransition()
            }
            break
        default:break
        }
    }
}
