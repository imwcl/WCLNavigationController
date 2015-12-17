//
//  oneAnimation.swift
//  WCLNavigationController
//
//  Created by wcl on 15/12/16.
//  Copyright © 2015年 W_C__L. All rights reserved.
//

import UIKit

class oneAnimation: WCLBaseAnimation {
    
    override func pushBefore() {
        self.fromVC?.view.frame = self.ViewFrame
        self.toVC?.view.frame = CGRectOffset(self.ViewFrame, self.ViewFrame.size.width, 0)
    }
    
    override func pushAnimation() {
        self.fromVC?.view.frame = CGRectOffset(self.ViewFrame, -self.ViewFrame.size.width/2.0, 0)
        self.toVC?.view.frame = CGRectOffset(self.ViewFrame, 0, 0)
    }
    
    override func popAnimation() {
        self.fromVC?.view.frame = CGRectOffset(self.ViewFrame, 0, 0)
        self.toVC?.view.frame = CGRectOffset(self.ViewFrame, self.ViewFrame.size.width, 0)
    }
}
