//
//  AppDelegate.swift
//  examples_28
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate:UIResponder,UIApplicationDelegate{
    var window:UIWindow?
    
    func application(application:UIApplication,didFinishLaunchingWithOptions launchOptions:[NSObject:AnyObject]?)->Bool{
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(cardTapped), name: "cardTapped", object: nil)
        return true
    }
    
    func cardTapped(n:NSNotification){
        print("card tapped: \(n.object)")
    }
}