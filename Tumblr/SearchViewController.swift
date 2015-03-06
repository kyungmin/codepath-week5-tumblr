//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Kyungmin Kim on 3/3/15.
//  Copyright (c) 2015 Kyungmin Kim. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingImage: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingImage.animationImages = [UIImage]()
        
        for var index = 1; index <= 3; index++ {
            var loadingImageName = String(format: "loading-%01d", index)
            loadingImage.animationImages?.append(UIImage(named: loadingImageName)!)
        }
    }

    override func viewDidAppear(animated: Bool) {
        // show loading icon for 1 sec
        loadingView.alpha = 0.9
        loadingImage.animationDuration = 0.7
        loadingImage.startAnimating()
        
        delay(1, closure: { () -> () in
            self.loadingImage.stopAnimating()
            self.loadingView.alpha = 0
        })
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
