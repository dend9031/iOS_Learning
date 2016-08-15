import UIKit

class MyClass1:NSObject{
    dynamic var value:Bool=false
}

private var con="ObserveValue"

class MyClass2:NSObject{
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        print("I heatd about the change!")
        if let keyPath=keyPath{
            print(object?.valueForKeyPath?(keyPath))
        }
        print(change)
        print(context == &con)
        let c = UnsafeMutablePointer<String>(context)
        let s = c.memory
        print(s)
    }
}

@UIApplicationMain
class AppDelegate:UIResponder,UIApplicationDelegate{
    var objectA:NSObject!
    var objectB:NSObject!
    var window: UIWindow?
    
    func application(application:UIApplication,didFinishLaunchingWithOptions:[NSObject:AnyObject]?)->Bool{
        self.window = UIWindow()
        self.window!.rootViewController = UIViewController()
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        objectA = MyClass1()
        objectB = MyClass2()
        let opts:NSKeyValueObservingOptions = [.New,.Old]
        objectA.addObserver(objectB, forKeyPath: "value", options: opts, context: &con)
        (objectA as! MyClass1).value = true
        objectA.removeObserver(objectB, forKeyPath: "value")
        return true
    }
}