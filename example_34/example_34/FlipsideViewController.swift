

import UIKit

protocol FlipsideViewControllerDelegate:class {
    func flipsideViewControllerDidFinish(controller:FlipsideViewController)
}

class FlipsideViewController: UIViewController{
    weak var delegate:FlipsideViewControllerDelegate!
    
    var observer:AnyObject!
    
    let which = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        switch which{
        case 0:
            self.observer = NSNotificationCenter.defaultCenter().addObserverForName("woohoo", object: nil, queue: nil){
                _ in
                self.description
            }
        case 1:
            self.observer = NSNotificationCenter.defaultCenter().addObserverForName("woohoo", object: nil, queue: nil){
                [unowned self] _ in
                self.description
            }
        default:break
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("unregister")
        NSNotificationCenter.defaultCenter().removeObserver(self.observer)
    }
    
    @IBAction func done(sender:AnyObject!){
        print("done")
        self.delegate?.flipsideViewControllerDidFinish(self)
    }
    
    deinit{
        print("deinit")
    }
}

extension FlipsideViewController:UIBarPositioningDelegate{
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
}
