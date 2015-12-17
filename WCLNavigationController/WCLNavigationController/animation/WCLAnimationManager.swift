//
//  WCLAnimationManager.swift
//  WCLNavigationController
//
//  Created by wcl on 15/12/16.
//  Copyright © 2015年 W_C__L. All rights reserved.
//

import UIKit

extension UINavigationController{
    
    func pushViewController(viewController: UIViewController, animationType:WCLBaseAnimation.Type, animated: Bool) {
        var AnimationManager:WCLAnimationManager? = objc_getAssociatedObject(self, "AnimationManager") as? WCLAnimationManager
        if AnimationManager == nil
        {
            AnimationManager = WCLAnimationManager(containerVC: self, animationClass: animationType)
            objc_setAssociatedObject(self, "AnimationManager", AnimationManager, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }else
        {
            AnimationManager!.animationClass = animationType
        }
        self.delegate = AnimationManager
        self.pushViewController(viewController, animated: animated)
    }
}

extension UIViewController{
    
    func presentViewController(viewController: UIViewController, animationType:WCLBaseAnimation.Type, animated: Bool, complete:(() ->Void)?) {
        var AnimationManager:WCLAnimationManager? = objc_getAssociatedObject(viewController, "AnimationManager") as? WCLAnimationManager
        if AnimationManager == nil
        {
            AnimationManager = WCLAnimationManager(containerVC: viewController, animationClass: animationType)
            objc_setAssociatedObject(self, "AnimationManager", AnimationManager, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }else
        {
            AnimationManager!.animationClass = animationType
        }
        viewController.transitioningDelegate = AnimationManager
        self.presentViewController(viewController, animated: animated, completion: complete)
    }
    
}

class WCLAnimationManager: NSObject,UINavigationControllerDelegate,UIViewControllerTransitioningDelegate {
    
    var animation:WCLBaseAnimation?
    var nav:UIViewController
    var animationClass:WCLBaseAnimation.Type?{
        didSet{
            self.animation = self.animationClass?.self.init(containerVC: self.nav)
        }
    }
    
    init(containerVC:UIViewController, animationClass:WCLBaseAnimation.Type)
    {
        self.animation = animationClass.self.init(containerVC: containerVC)
        self.nav = containerVC
        super.init()
        self.animationClass = animationClass
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.animation!.interacting == true ? self.animation : nil
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.animation?.isPush = true
        return self.animation
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.animation?.isPush = false
        return self.animation
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Push{
            self.animation!.isPush = true
        }else{
            self.animation!.isPush = false
        }
        return self.animation
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.animation!.interacting == true ? self.animation : nil
    }
}
