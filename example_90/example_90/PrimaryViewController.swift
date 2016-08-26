import UIKit

class PrimaryViewController: UIViewController {
    var verticalConstraints:[NSLayoutConstraint]?
    var exposed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.greenColor()
        let segmentedControl = UISegmentedControl(items: ["White", "Red"])
        segmentedControl.selectedSegmentIndex = 1
        self.view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
            segmentedControl.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
        segmentedControl.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
        ])
        segmentedControl.addTarget(self, action: #selector(change), forControlEvents:.ValueChanged)
    }
    
    func change(sender:AnyObject){
        var viewController:UIViewController
        if !self.splitViewController!.collapsed {
            viewController = self.splitViewController!.viewControllers[1]
        }else{
            viewController = self.childViewControllers[0]
        }
        
        let segmentedControl = sender as! UISegmentedControl
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewController.view.backgroundColor = UIColor.whiteColor()
        case 1:
            viewController.view.backgroundColor = UIColor.redColor()
        default: break
        }
    }
    
    override func collapseSecondaryViewController(secondaryViewController: UIViewController, forSplitViewController splitViewController: UISplitViewController) {
        
        self.addChildViewController(secondaryViewController)
        self.view.addSubview(secondaryViewController.view)
        secondaryViewController.didMoveToParentViewController(self)
        
        secondaryViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[v]|", options: [], metrics: nil, views: ["v":secondaryViewController.view])
        
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("H:|[v]", options: [], metrics: nil, views: ["v":secondaryViewController.view]),
            self.verticalConstraints!
            ].flatten().map{$0})
    }
}

extension UIViewController{
    func showHide(sender:AnyObject){
        let target = self.targetViewControllerForAction(#selector(showHide), sender: sender)
        if target != nil{
            target!.showHide(self)
        }
    }
}

extension PrimaryViewController {
    override func showHide(sender: AnyObject) {
        let splitViewController = self.splitViewController!
        if !splitViewController.collapsed{
            switch splitViewController.displayMode {
            case .PrimaryHidden:
                UIView.animateWithDuration(0.2, animations:{
                    splitViewController.preferredDisplayMode = .PrimaryOverlay
                })
            default:
                splitViewController.preferredDisplayMode = .Automatic
            }
        }else{
            let viewController = sender as! UIViewController
            var constraint = 0
            if !self.exposed{
                constraint = 270
            }
            self.exposed = !self.exposed
            self.view.removeConstraints(self.verticalConstraints!)
            NSLayoutConstraint.constraintsWithVisualFormat("V:|-(minuscon)-[v]-(con)-|", options: [], metrics:["con":constraint,"minuscon":-constraint], views: ["v":viewController.view])
            NSLayoutConstraint.activateConstraints(self.verticalConstraints!)
            UIView.animateWithDuration(0.25, animations:{
                self.view.layoutIfNeeded()
            })
        }
    }
}
