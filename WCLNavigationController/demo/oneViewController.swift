//
//  oneViewController.swift
//  WCLNavigationController
//
//  Created by wcl on 15/12/6.
//  Copyright © 2015年 W_C__L. All rights reserved.
//

import UIKit

class oneViewController: UIViewController {
    
    
    @IBOutlet weak var popBT: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if self.navigationController != nil
        {
            self.popBT.setTitle("pop", forState: UIControlState.Normal)
        }else
        {
            self.popBT.setTitle("dismiss", forState: UIControlState.Normal)
        }
    }
    @IBAction func pop(sender: AnyObject) {
        if self.navigationController != nil
        {
            self.navigationController?.popViewControllerAnimated(true)
        }else
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
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
