//
//  ViewController.swift
//  WCLNavigationController
//
//  Created by wcl on 15/12/6.
//  Copyright © 2015年 W_C__L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func push(sender: AnyObject) {
        self.navigationController?.pushViewController(oneViewController(), animationType: oneAnimation.self, animated: true)
    }
    
    @IBAction func push2(sender: AnyObject) {
        self.navigationController?.pushViewController(oneViewController(), animationType: twoAnimation.self, animated: true)

    }
    @IBAction func push3(sender: AnyObject) {
        self.navigationController?.pushViewController(oneViewController(), animationType: threeAnimation.self, animated: true)
        
    }
    
    @IBAction func present1(sender: AnyObject) {
        self.presentViewController(oneViewController(), animationType: oneAnimation.self, animated: true, complete: nil)

    }
    
    @IBAction func present2(sender: AnyObject) {
        self.presentViewController(oneViewController(), animationType: twoAnimation.self, animated: true, complete: nil)

    }
    
    @IBAction func present3(sender: AnyObject) {
        self.presentViewController(oneViewController(), animationType: threeAnimation.self, animated: true, complete: nil)
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
