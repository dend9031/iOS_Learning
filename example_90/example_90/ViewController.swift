import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [PrimaryViewController(),SecondaryViewController()]
        self.addChildViewController(splitViewController)
        self.view.addSubview(splitViewController.view)
        splitViewController.didMoveToParentViewController(self)
        
        splitViewController.presentsWithGesture = false
        splitViewController.preferredDisplayMode = .PrimaryHidden
    }
    
    override func targetViewControllerForAction(action: Selector, sender: AnyObject?) -> UIViewController? {
        if action == #selector(showHide){
            let splitViewController = self.childViewControllers[0] as! UISplitViewController
            let primaryViewController = splitViewController.viewControllers[0]
            if primaryViewController.canPerformAction(action, withSender: sender){
                return primaryViewController
            }
        }
        return super.targetViewControllerForAction(action, sender: sender)
    }
}

