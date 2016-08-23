//
//  ViewController.swift
//  example-70
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sv = UIScrollView()
        sv.backgroundColor = UIColor.whiteColor()
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        
        var constraints = [NSLayoutConstraint]()
        constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[sv]|", options: [], metrics: nil, views: ["sv":sv]))
        constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[sv]|", options: [], metrics: nil, views: ["sv":sv]))
        
        let v = UIView()
        sv.addSubview(v)
        NSLayoutConstraint.activateConstraints(constraints)
        
        var w:CGFloat = 0
        var y:CGFloat = 10
        for i in 0..<30{
            let label = UILabel()
            label.text = "This is label \(i+1)"
            label.sizeToFit()
            label.frame.origin = CGPointMake(10,y)
            v.addSubview(label)
            y += label.bounds.size.height + 10
            
            if label.bounds.width > w {
                w = label.bounds.width
            }
        }
        
        v.frame = CGRectMake(0, 0, w + 20, y)
        sv.contentSize = v.frame.size
        
        v.tag = 999
        sv.minimumZoomScale = 1.0
        sv.maximumZoomScale = 2.0
        sv.delegate = self
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return scrollView.viewWithTag(999)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

