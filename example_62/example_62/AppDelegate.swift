//
//  AppDelegate.swift
//  example_62
//
//  Created by Artem Cherkasov on 8/19/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var pep: [String]!


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow()
        
        self.setUpPageViewController()
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }

    
    func setUpPageViewController(){
        self.pep = ["Jack", "Manny","Moe"]
        let pvc = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        let page = Pep(pepBoy: self.pep[0])
        pvc.setViewControllers([page], direction: .Forward, animated: false, completion: nil)
        pvc.dataSource = self
        self.window!.rootViewController = pvc
        
        let proxy = UIPageControl.appearance()
        proxy.pageIndicatorTintColor = UIColor.redColor().colorWithAlphaComponent(0.6)
        proxy.currentPageIndicatorTintColor = UIColor.redColor()
        proxy.backgroundColor = UIColor.yellowColor()
        
        self.messWithGestureRecognizers(pvc)
    }

}

extension AppDelegate: UIPageViewControllerDataSource {
    func pageViewController(pageViewController:UIPageViewController,viewControllerAfterViewController viewController:UIViewController) -> UIViewController?{
        let boy  = (viewController as! Pep).boyName
        let index = self.pep.indexOf(boy)! + 1
        if index  >= self.pep.count{
            return nil
        }
        return Pep(pepBoy: self.pep[index])
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let boy = (viewController as! Pep).boyName
        let index = self.pep.indexOf(boy)! - 1
        if index < 0 {
            return nil
        }
        
        return Pep(pepBoy: self.pep[index])
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pep.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        let page  = pageViewController.viewControllers![0] as! Pep
        let boy = page.boyName
        return self.pep.indexOf(boy)!
    }
    
    func messWithGestureRecognizers(pageViewController:UIPageViewController){
        if pageViewController.transitionStyle == .PageCurl{
            for g in pageViewController.gestureRecognizers{
                if let g = g as? UITapGestureRecognizer{
                    g.numberOfTapsRequired = 2
                }
            }
        }else{
            NSNotificationCenter.defaultCenter().addObserverForName("tap", object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: {
                n in
                let g = n.object as! UIGestureRecognizer
                let which = g.view!.tag
                let vc0 = pageViewController.viewControllers![0]
                let vc = (which == 0 ? self.pageViewController(pageViewController, viewControllerBeforeViewController: vc0) : self.pageViewController(pageViewController, viewControllerAfterViewController:vc0))
                if vc == nil {
                    return
                }
                
                let dir:UIPageViewControllerNavigationDirection = which == 0 ? .Reverse : .Forward
                UIApplication.sharedApplication().beginIgnoringInteractionEvents()
                pageViewController.setViewControllers([vc!], direction: dir, animated: true, completion: {
                    _ in
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                })
            })
        }
    }
}

