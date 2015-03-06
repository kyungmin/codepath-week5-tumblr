//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Kyungmin Kim on 3/3/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var contentView: UIView!
    var homeVC :HomeViewController!
    var searchVC :SearchViewController!
    var composeVC :ComposeViewController!
    var accountVC :AccountViewController!
    var trendingVC :TrendingViewController!
    var currentVC :UIViewController!
    
    var isPresenting: Bool = true
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var exploreBubble: UIImageView!
    
    var tabVCs = []
    var tabButtons = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize VCs
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeVC = storyboard.instantiateViewControllerWithIdentifier("homeStory") as HomeViewController
        searchVC = storyboard.instantiateViewControllerWithIdentifier("searchStory") as SearchViewController
        composeVC = storyboard.instantiateViewControllerWithIdentifier("composeStory") as ComposeViewController
        accountVC = storyboard.instantiateViewControllerWithIdentifier("accountStory") as AccountViewController
        trendingVC = storyboard.instantiateViewControllerWithIdentifier("trendingStory") as TrendingViewController

        // set initial tabs in order
        tabVCs = [homeVC, searchVC, composeVC, accountVC, trendingVC]
        tabButtons = [homeButton, searchButton, composeButton, accountButton, trendingButton]
        
        // set home as default tab
        currentVC = homeVC
        addChildViewController(currentVC)
        currentVC.view.frame = contentView.frame
        contentView.addSubview(currentVC.view)
        currentVC.didMoveToParentViewController(self)
        
        // bubble animation
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.exploreBubble.transform = CGAffineTransformMakeTranslation(0, 10)
            }) { (finished: Bool) -> Void in
                //
        }

    }

    func removeChildView(content: UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }

    @IBAction func didPressButton(sender: AnyObject) {
        var button = sender as UIButton
        var selectedVC = tabVCs[button.tag] as UIViewController
        var selectedView = selectedVC.view

        for tabButton in tabButtons as [UIButton] {
            tabButton.selected = false
        }
        
        removeChildView(currentVC)
        addChildViewController(selectedVC)
        selectedView.frame = contentView.frame
        contentView.addSubview(selectedView)

        selectedVC.didMoveToParentViewController(self)
        currentVC = selectedVC
        button.selected = true
        
        // hide bubble if search tab is selected
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            if (self.currentVC == self.searchVC) {
                self.exploreBubble.alpha = 0
            } else {
                self.exploreBubble.alpha = 1
            }
        })
    }
    
    @IBAction func didPressComposeButton(sender: AnyObject) {
        performSegueWithIdentifier("composeSegue", sender: self)
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as ComposeViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
    }


}
