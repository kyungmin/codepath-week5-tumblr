//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Kyungmin Kim on 3/3/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var loginForm: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginForm.alpha = 0
        cancelButton.alpha = 0
        loginForm.transform = CGAffineTransformMakeScale(0.7, 0.7)
    }

    @IBAction func didPressLogin(sender: AnyObject) {
        UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: {
            self.loginForm.transform = CGAffineTransformMakeScale(1, 1)
            self.loginForm.alpha = 1
            self.cancelButton.alpha = 1
            }, completion: nil)
    }
    
    @IBAction func didPressCancel(sender: AnyObject) {
        UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: {
            self.loginForm.transform = CGAffineTransformMakeScale(0.7, 0.7)
            self.loginForm.alpha = 0
            self.cancelButton.alpha = 0
            
            }, completion: nil)
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
