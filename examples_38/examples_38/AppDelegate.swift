//
//  AppDelegate.swift
//  examples_38
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow()
        self.window!.rootViewController = UIViewController()
        let mainview = self.window!.rootViewController!.view
        let v = UIView(frame:CGRectMake(100,100,50,50))
        v.backgroundColor = UIColor.redColor()
        mainview.addSubview(v)
        self.window!.backgroundColor = UIColor.darkGrayColor()
        self.window!.makeKeyAndVisible()
        return true
    }

}

