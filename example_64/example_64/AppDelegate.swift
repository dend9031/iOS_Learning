//
//  AppDelegate.swift
//  example_64
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow()
        let rvc = RootViewController()
        rvc.restorationIdentifier = "root"
        let nav = UINavigationController(rootViewController: rvc)
        nav.restorationIdentifier = "nav"
        self.window!.rootViewController = nav
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.restorationIdentifier = "window"
        self.window!.makeKeyAndVisible()
        return true
    }
    
    
    func application(application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
}

