import UIKit
@UIApplicationMain
class AppDelegate:UIResponder, UIApplicationDelegate{
    var window: UIWindow?
    func application(application:UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?)->Bool{
        self.window = UIWindow()
        self.window!.rootViewController = MyViewController(nibName: "MyViewController", bundle: nil)
        self.window!.backgroundColor = UIColor.orangeColor()
        self.window!.makeKeyAndVisible()
        return true
    }
}