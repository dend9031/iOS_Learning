//
//  AppDelegate.swift
//  example_59
//
//  Created by Artem Cherkasov on 8/19/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let arr = UINib(nibName: "Main", bundle: nil).instantiateWithOwner(nil, options: nil)
        self.window!.rootViewController = arr[0] as? UIViewController
        return true
    }
}

