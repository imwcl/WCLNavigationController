//
//  threeAnimation.swift
//  WCLNavigationController
//
//  Created by wcl on 15/12/16.
//  Copyright © 2015年 W_C__L. All rights reserved.
//

import UIKit

class threeAnimation: WCLBaseAnimation {
    
    override func pushBefore() {
        self.fromVC?.view.frame = self.ViewFrame
        self.toVC?.view.frame = CGRectOffset(self.ViewFrame, 0, 0)
        self.toVC?.view.alpha = 0
        self.fromVC?.view.alpha = 1
    }
    
    override func pushAnimation() {
        self.toVC?.view.alpha = 1
    }
    
    override func popAnimation() {
        self.toVC?.view.alpha = 0
    }

}
