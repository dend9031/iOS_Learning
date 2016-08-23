

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sv  = UIScrollView()
        sv.backgroundColor = UIColor.whiteColor()
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        var con = [NSLayoutConstraint]()
        con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[sv]|", options: [], metrics: nil, views: ["sv":sv]))
        con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[sv]|", options: [], metrics: nil, views:["sv":sv]))
        var previousLabel:UILabel? = nil
        for i in 0..<30 {
            let label = UILabel()
            label.backgroundColor = UIColor.redColor()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "This is label \(i+1)"
            sv.addSubview(label)
            con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[lab]", options: [], metrics: nil, views: ["lab":label]))
            if previousLabel == nil {
                con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(10)-[lab]", options: [], metrics: nil, views: ["lab":label]))
            }else{
                con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[prev]-(10)-[lab]", options: [], metrics: nil, views: ["prev": previousLabel!,"lab": label]))
            }
            previousLabel = label
        }
        con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[lab]-(10)-|", options: [], metrics: nil, views: ["lab":previousLabel!]))
        NSLayoutConstraint.activateConstraints(con)
//        var y: CGFloat = 10
//        
//        for i in 0..<30 {
//            let lab = UILabel()
//            lab.text = "This is label \(i+1)"
//            lab.sizeToFit()
//            lab.frame.origin = CGPointMake(10, y)
//            lab.backgroundColor = UIColor.redColor()
//            lab.autoresizingMask = .FlexibleWidth
//            sv.addSubview(lab)
//            y += lab.bounds.size.height + 10
//        }
//        
//        var sz = sv.bounds.size
//        sz.height = y
//        sv.contentSize = sz
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

