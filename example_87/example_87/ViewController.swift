//
//  ViewController.swift
//  example_87
//
//  Created by Artem Cherkasov on 8/24/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doButton(sender:AnyObject){
        let viewController = UIViewController()
        viewController.preferredContentSize = CGSizeMake(400, 500)
        viewController.modalPresentationStyle = .Popover
        
        if let  pres = viewController.presentationController{
            pres.delegate = self
        }
        
        self.presentViewController(viewController, animated: true, completion: nil)
        
        let wv = UIWebView()
        wv.backgroundColor = UIColor.whiteColor()
        viewController.view.addSubview(wv)
        wv.frame = viewController.view.bounds
        wv.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        let f = NSBundle.mainBundle().pathForResource("linkhelp", ofType: "html")
        let s = try! String(contentsOfFile: f!, encoding: NSUTF8StringEncoding)
        wv.loadHTMLString(s, baseURL: nil)
        
        if let pop = viewController.popoverPresentationController{
            pop.sourceView = (sender as! UIView)
            pop.sourceRect = (sender as! UIView).bounds
            pop.backgroundColor = UIColor.whiteColor()
        }
    }
}

extension ViewController:UIPopoverPresentationControllerDelegate{
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        if traitCollection.horizontalSizeClass == .Compact{
            return .FullScreen
        }
        return .None
    }
    
    func presentationController(controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        if style != .Popover{
            let viewController = controller.presentedViewController
            let nav = UINavigationController(rootViewController: viewController)
            let b = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(dismissHelp))
            viewController.navigationItem.rightBarButtonItem = b
            return nav
        }
        return nil
    }
    
    func dismissHelp(sender:AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

