import UIKit

func delay(delay:Double, closure:()->()){
    dispatch_after(
        dispatch_time(
         DISPATCH_TIME_NOW,
         Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

class ViewController: UIViewController {
    @IBOutlet  var button: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var oldChoice = -1
    
    @IBAction func doPopover1(sender:AnyObject?){
        let vc = PopoverViewController()
        let nav = UINavigationController(rootViewController: vc)
        let b = UIBarButtonItem(barButtonSystemItem: .Cancel, target:self, action: #selector(cancelPop1))
        vc.navigationItem.rightBarButtonItem = b
        let b2 = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(savePop1))
        vc.navigationItem.leftBarButtonItem = b2
        let bb = UIButton(type: .InfoDark)
        bb.addTarget(self, action: #selector(doPresent), forControlEvents: .TouchUpInside)
        bb.sizeToFit()
        vc.navigationItem.titleView = bb
        nav.modalPresentationStyle = .Popover
        self.presentViewController(nav, animated: true,completion: nil)
        
        if let pop = nav.popoverPresentationController{
            pop.barButtonItem = sender as? UIBarButtonItem
            pop.delegate = self
            
            delay(0.1){
                pop.passthroughViews = nil
            }
            
            pop.backgroundColor = UIColor.yellowColor()
        }
        
        nav.navigationBar.barTintColor = UIColor.redColor()
        nav.navigationBar.tintColor = UIColor.whiteColor()
        nav.delegate = self
    }
    
    func cancelPop1(sender:AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
        NSUserDefaults.standardUserDefaults().setInteger(self.oldChoice, forKey: "choice")
    }
    
    func doPresent(sender:AnyObject){
        let evc = ExtraViewController(nibName: nil, bundle: nil)
        self.presentedViewController!.presentViewController(evc,animated:true,completion: nil)
    }
    
    @IBAction func doButton(sender:AnyObject){
        let view = sender as! UIView
        let viewController = UIViewController()
        viewController.modalPresentationStyle = .Popover
        self.presentViewController(viewController,animated: true, completion:  nil)
        if let pop = viewController.popoverPresentationController{
            pop.sourceView = view
            pop.sourceRect = view.bounds
            pop.delegate = self
            pop.popoverLayoutMargins = UIEdgeInsetsMake(0, 0, 0, 30)
        }
    }
    
    @IBAction func doPopover2(sender:AnyObject){
        let viewController = UIViewController()
        viewController.modalPresentationStyle = .Popover
        
        self.presentViewController(viewController, animated: true, completion: nil)
        viewController.view.frame = CGRectMake(0, 0, 300, 300)
        viewController.view.backgroundColor = UIColor.greenColor()
        viewController.preferredContentSize = CGSizeMake(300, 300)
        let label = UILabel()
        label.text = "I am a very silly popover"
        label.sizeToFit()
        label.center = CGPointMake(150, 150)
        label.frame = CGRectIntegral(label.frame)
        viewController.view.addSubview(label)
        let  t = UITapGestureRecognizer(target:self, action: #selector(tapped))
        viewController.view.addGestureRecognizer(t)
    }
    
    func tapped(sender:AnyObject){
        let viewController = UIViewController()
        viewController.modalPresentationStyle = .CurrentContext
        viewController.view.frame = CGRectMake(0, 0, 300, 300)
        viewController.view.backgroundColor = UIColor.whiteColor()
        viewController.preferredContentSize = viewController.view.bounds.size
        let b = UIButton(type: .System)
        b.setTitle("Done", forState: .Normal)
        b.sizeToFit()
        b.center = CGPointMake(150, 150)
        b.frame = b.frame.integral
        b.autoresizingMask = .None
        b.addTarget(self, action: #selector(done), forControlEvents: .TouchUpInside)
        viewController.view.addSubview(b)
        viewController.modalTransitionStyle = .FlipHorizontal
        let presenter = self.presentedViewController!
        presenter.presentViewController(viewController, animated: true, completion:{
            _ in
            print("presented")
        })
    }
    
    func done(sender:UIResponder){
        var responder:UIResponder! = sender
        repeat{responder = responder.nextResponder()} while !(responder is UIViewController)
        (responder as! UIViewController).dismissViewControllerAnimated(true, completion:{
            print("dismissed")
        })
    }
    
    func savePop1(sender:AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController:UINavigationControllerDelegate{
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        navigationController.preferredContentSize = viewController.preferredContentSize
    }
}

extension ViewController:UIPopoverPresentationControllerDelegate {
    func prepareForPopoverPresentation(popoverPresentationController: UIPopoverPresentationController) {
        if popoverPresentationController.presentedViewController is UINavigationController{
            self.oldChoice = NSUserDefaults.standardUserDefaults().integerForKey("choice")
        }
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController) {
        if popoverPresentationController.presentedViewController is UINavigationController{
            NSUserDefaults.standardUserDefaults().setInteger(self.oldChoice, forKey: "choice")
        }
    }
    
    func popoverPresentationController(popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverToRect rect: UnsafeMutablePointer<CGRect>, inView view: AutoreleasingUnsafeMutablePointer<UIView?>) {
        if view.memory == self.button{
            rect.memory = self.button2.bounds
            view.memory = self.button2
        }
    }
    
    func popoverPresentationControllerShouldDismissPopover(popoverPresentationController: UIPopoverPresentationController) -> Bool {
        let ok = popoverPresentationController.presentedViewController.presentedViewController == nil
        return ok
    }
}

extension ViewController:UIToolbarDelegate{
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
}

