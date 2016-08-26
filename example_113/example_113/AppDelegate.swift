import UIKit

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if let n = launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification{
            delay(0.5){
                self.doAlert(n)
            }
        }
        
        return true
    }
    
    func doAlert(n:UILocalNotification){
        let inactive = UIApplication.sharedApplication().applicationState == .Inactive
        let s = inactive ? "inactive":"active"
        let alert = UIAlertController(title: "Hey", message: "While \(s), I recieved a local notification: \(n.alertBody)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title:"OK",style: .Default, handler: nil))
        self.window!.rootViewController!.presentViewController(alert, animated: true, completion: nil)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        NSNotificationCenter.defaultCenter().postNotificationName("didRegisterUserNotificationSettings", object: self)
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        doAlert(notification)
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        if let s = responseInfo[UIUserNotificationActionResponseTypedTextKey]as? String{
            print(s)
        }
    }
}

