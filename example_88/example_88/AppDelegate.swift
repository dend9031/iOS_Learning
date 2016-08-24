//
//  AppDelegate.swift
//  example_88
//
//  Created by Artem Cherkasov on 8/24/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var didChooseDetail = false

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow()
        let splitViewController = UISplitViewController()
        splitViewController.delegate = self
        
        let masterViewController = MasterViewController()
        let detailViewController = DetailedViewController()
        
        let masterNavigationController = UINavigationController(rootViewController: masterViewController)
        let deatilNavigationController = UINavigationController(rootViewController: detailViewController)
        
        splitViewController.viewControllers = [masterNavigationController,deatilNavigationController]
        
        self.window!.rootViewController = splitViewController
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }
    
}

extension AppDelegate:UISplitViewControllerDelegate{
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return !self.didChooseDetail
    }
}
