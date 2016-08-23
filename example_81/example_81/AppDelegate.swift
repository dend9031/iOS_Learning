//
//  AppDelegate.swift
//  example_81
//
//  Created by Artem Cherkasov on 8/23/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow()
        self.window!.rootViewController = RootViewController(nibName:"RootViewController", bundle: nil)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }
}

