//
//  twoAnimation.swift
//  WCLNavigationController
//
//  Created by wcl on 15/12/16.
//  Copyright © 2015年 W_C__L. All rights reserved.
//

import UIKit

class twoAnimation: WCLBaseAnimation {
    
    override func pushBefore() {
        self.toVC!.view.frame = self.ViewFrame
        self.toVC!.view.frame = CGRectOffset(self.ViewFrame, self.ViewFrame.size.width, 0)
    }
    
    override func pushAnimation() {
        self.toVC!.view.frame = (self.toVC?.view.bounds)!
        let tranfScale:CGAffineTransform = CGAffineTransformIdentity
        self.fromVC!.view.transform = CGAffineTransformScale(tranfScale, 0.9, 0.9)
    }
    
    override func popAnimation() {
        let tranfScale:CGAffineTransform = CGAffineTransformIdentity
        self.fromVC?.view.transform = CGAffineTransformScale(tranfScale, 1, 1)
        self.toVC!.view.frame = CGRectOffset(self.fromVC!.view.frame, self.toVC!.view.frame.size.width, 0)
    }
}
