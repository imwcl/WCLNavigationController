//
//  WCLNavigationController.swift
//  WCLNavigationController
//
//  Created by wcl on 15/12/6.
//  Copyright © 2015年 W_C__L. All rights reserved.
//

import UIKit

class WCLNavigationController: UINavigationController,UINavigationControllerDelegate {
    
    var navAnimation:WCLNavanimation = WCLNavanimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = self
        self.navigationBarHidden = true
        self.navigationBar.translucent = false
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Push{
            self.navAnimation.isPush = true
        }else{
            self.navAnimation.isPush = false
        }
        return self.navAnimation
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
