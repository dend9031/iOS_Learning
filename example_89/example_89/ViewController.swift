import UIKit

class ViewController: UIViewController {
    @IBOutlet var containerView: UIView!
    var didInitailSetup = false
    let which = 2
    
    override func addChildViewController(childController: UIViewController) {
        super.addChildViewController(childController)
        if let splitViewController = self.childViewControllers[0] as? UISplitViewController{
            splitViewController.delegate = self
        }
    }
    
    override func viewWillLayoutSubviews() {
        if !self.didInitailSetup{
            self.didInitailSetup = true
            self.view.backgroundColor = UIColor.greenColor()
            let splitViewController = self.childViewControllers[0] as! UISplitViewController
            splitViewController.preferredDisplayMode = .AllVisible
            
            splitViewController.preferredPrimaryColumnWidthFraction = 0.5
            splitViewController.maximumPrimaryColumnWidth = 500
            
            if which == 1{
                let traits = UITraitCollection(traitsFromCollections:[
                    UITraitCollection(horizontalSizeClass: .Regular)
                ])
                self.setOverrideTraitCollection(traits, forChildViewController: splitViewController)
            }
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let splitViewController = self.childViewControllers[0] as! UISplitViewController
        if which == 2{
            if size.width > size.height{
                let traits = UITraitCollection(traitsFromCollections:[
                    UITraitCollection(horizontalSizeClass: .Regular)
                ])
                self.setOverrideTraitCollection(traits, forChildViewController: splitViewController)
            }else{
                self.setOverrideTraitCollection(nil,forChildViewController: splitViewController)
            }
        }
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
}

extension ViewController:UISplitViewControllerDelegate{
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return true
    }
}

