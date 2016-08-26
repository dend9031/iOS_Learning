import UIKit

class SecondaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        let button = UIButton(type: .System)
        button.setTitle("Configure", forState: .Normal)
        button.backgroundColor = UIColor.yellowColor()
        button.addTarget(self, action: #selector(callShowHide), forControlEvents:.TouchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
             NSLayoutConstraint.constraintsWithVisualFormat("H:[b]-|", options: [], metrics: nil, views: ["b":button]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:[b]-|", options: [], metrics: nil, views: ["b":button])
            ].flatten().map{$0})
    }
    
    func callShowHide(sender:AnyObject){
        self.showHide(sender)
    }
}
