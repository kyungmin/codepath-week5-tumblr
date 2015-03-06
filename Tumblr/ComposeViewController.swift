//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Kyungmin Kim on 3/3/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var textIcon: UIImageView!
    @IBOutlet weak var photoIcon: UIImageView!
    @IBOutlet weak var quoteIcon: UIImageView!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var chatIcon: UIImageView!
    @IBOutlet weak var videoIcon: UIImageView!
   
    var isPresenting: Bool = true
    
    var icons = []
    var delay: NSTimeInterval = 0
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        icons = [textIcon, photoIcon, quoteIcon, linkIcon, chatIcon, videoIcon]

        // set initial icon y position
        for icon in icons as [UIImageView] {
            icon.center.y = 568 + icon.frame.height / 2
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        for icon in self.icons as [UIImageView] {
            
            // generate random delays
            delay = NSTimeInterval(arc4random_uniform(100)) / 500

            UIView.animateWithDuration(0.4, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 20, options: nil, animations: { () -> Void in

                if (icon.tag < 3) {
                    icon.center.y = 145
                } else {
                    icon.center.y = 285
                }
            }, completion: nil)
        }
    }

    override func viewWillDisappear(animated: Bool) {

        for icon in self.icons as [UIImageView] {
            
            // generate random delays
            delay = NSTimeInterval(arc4random_uniform(100)) / 500
            
            UIView.animateWithDuration(0.4, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 20, options: nil, animations: { () -> Void in
                
                // move icons up
                icon.center.y = -icon.frame.height / 2
                
                }, completion: nil)
        }
    }
    
    @IBAction func didPressDismissButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
