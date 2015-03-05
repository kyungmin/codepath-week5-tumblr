//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Kyungmin Kim on 3/3/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    var homeVC :HomeViewController!
    var searchVC :SearchViewController!
    var composeVC :ComposeViewController!
    var accountVC :AccountViewController!
    var trendingVC :TrendingViewController!
    var currentVC :UIViewController!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
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
