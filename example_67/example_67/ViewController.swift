//
//  ViewController.swift
//  example_67
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sv:UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        sv = UIScrollView()
        sv!.backgroundColor = UIColor.whiteColor()
        sv!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv!)
        var con = [NSLayoutConstraint]()
        con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[sv]|", options: [], metrics: nil, views: ["sv":sv!]))
        con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[sv]|", options: [], metrics: nil, views: ["sv":sv!]))
        let v = UIView()
        sv!.addSubview(v)
        var previousLabel: UILabel? = nil
        for i in 0..<30{
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "This is label \(i+1)"
            label.sizeToFit()
            v.addSubview(label)
            con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[lab]", options: [], metrics: nil, views: ["lab":label]))
            if previousLabel == nil{
            con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(10)-[lab]", options: [], metrics: nil, views: ["lab":label]))
            }else{
                con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[prev]-(10)-[lab]", options: [], metrics: nil, views: ["lab":label, "prev": previousLabel!]))
            }
            previousLabel = label
        }
        con.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[lab]-(10)-|", options: [], metrics: nil, views: ["lab": previousLabel!]))
        NSLayoutConstraint.activateConstraints(con)
        let minsz = v.systemLayoutSizeFittingSize(UILayoutFittingExpandedSize)
        v.frame = CGRectMake(0, 0, 0, minsz.height)
        sv!.contentSize = v.frame.size
        sv!.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
        sv!.scrollIndicatorInsets = sv!.contentInset
    }
    
    override func viewWillLayoutSubviews() {
        if let sv = self.sv{
            let top = self.topLayoutGuide.length
            let bottom = self.bottomLayoutGuide.length
            sv.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0)
            sv.scrollIndicatorInsets = self.sv!.contentInset
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

