//
//  AppDelegate.swift
//  example_65
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var pep : [String]!


    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow()
        
        self.setUpPageViewController()
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }
    
    func application(application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func setUpPageViewController(){
        self.pep = ["Manny","Moe","Jack"]
        let pvc = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        let page = Pep(pepBoy: self.pep[0])
        pvc.setViewControllers([page], direction: .Forward, animated: false, completion: nil)
        pvc.dataSource = self
        self.window!.rootViewController = pvc
        
        let proxy = UIPageControl.appearance()
        proxy.pageIndicatorTintColor = UIColor.orangeColor().colorWithAlphaComponent(0.6)
        proxy.currentPageIndicatorTintColor = UIColor.orangeColor()
        proxy.backgroundColor = UIColor.blackColor()
    }
    
    func application(application: UIApplication, willEncodeRestorableStateWithCoder coder: NSCoder) {
        let pvc = self.window!.rootViewController as! UIPageViewController
        let boy = (pvc.viewControllers![0] as! Pep).boy
        coder.encodeObject(boy,forKey: "boy")
    }
    
    func application(application: UIApplication, didDecodeRestorableStateWithCoder coder: NSCoder) {
        let boy:AnyObject? = coder.decodeObjectForKey("boy")
        if let boy = boy as? String {
            let pvc = self.window!.rootViewController as! UIPageViewController
            let pep = Pep(pepBoy: boy)
            pvc.setViewControllers([pep], direction: .Forward, animated: false, completion: nil)
        }
    }
}

extension AppDelegate:UIPageViewControllerDataSource{
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let boy = (viewController as! Pep).boy
        let index = self.pep.indexOf(boy)! + 1
        if index >= self.pep.count {
            return nil
        }
        return Pep(pepBoy: self.pep[index])
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let boy = (viewController as! Pep).boy
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
        let page = pageViewController.viewControllers![0] as! Pep
        let boy = page.boy
        return self.pep.indexOf(boy)!
    }
}

