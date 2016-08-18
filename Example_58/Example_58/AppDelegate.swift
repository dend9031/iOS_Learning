//
//  AppDelegate.swift
//  Example_58
//
//  Created by Artem Cherkasov on 8/18/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow()
        let theRVC = RootViewController()
        self.window!.rootViewController = theRVC
        self.window!.backgroundColor = UIColor.orangeColor()
        self.window!.makeKeyAndVisible()
        return true
    }

}

