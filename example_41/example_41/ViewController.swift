//
//  ViewController.swift
//  example_41
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mainview = self.view
        let v1 = UIView(frame: CGRectMake(100,111,132,194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView()
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView()
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        mainview.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        v2.translatesAutoresizingMaskIntoConstraints = false
        v2.translatesAutoresizingMaskIntoConstraints = false
        
//        v1.addConstraint(NSLayoutConstraint(item: v2, attribute: .Leading, relatedBy: .Equal, toItem: v1, attribute: .Leading, multiplier: 1, constant: 0))
//        
//        v1.addConstraint(NSLayoutConstraint(item: v2, attribute: .Trailing, relatedBy: .Equal, toItem: v1, attribute: .Trailing, multiplier: 1, constant: 0))
//        
//        v1.addConstraint(NSLayoutConstraint(item: v2, attribute: .Top, relatedBy: .Equal, toItem: v1, attribute: .Top, multiplier: 1, constant: 0))
//        
//        v2.addConstraint(NSLayoutConstraint(item: v2, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 0))
//        
//        v3.addConstraint(NSLayoutConstraint(item: v3, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 20))
//        
//        v3.addConstraint(NSLayoutConstraint(item: v3, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute:.NotAnAttribute, multiplier: 1, constant: 20))
//        
//        v1.addConstraint(NSLayoutConstraint(item: v3, attribute: .Trailing, relatedBy: .Equal, toItem: v1, attribute: .Trailing, multiplier: 1, constant: 0))
//        
//        v1.addConstraint(NSLayoutConstraint(item: v3, attribute: .Bottom, relatedBy: .Equal, toItem: v1, attribute: .Bottom, multiplier: 1, constant: 0))
        
//        NSLayoutConstraint.activateConstraints([
//                v2.leadingAnchor.constraintEqualToAnchor(v1.leadingAnchor),
//                v2.trailingAnchor.constraintEqualToAnchor(v1.trailingAnchor),
//                v2.topAnchor.constraintEqualToAnchor(v1.topAnchor),
//                v2.heightAnchor.constraintEqualToConstant(10),
//                v3.widthAnchor.constraintEqualToConstant(20),
//                v3.heightAnchor.constraintEqualToConstant(20),
//                v3.trailingAnchor.constraintEqualToAnchor(v1.trailingAnchor),
//                v3.bottomAnchor.constraintEqualToAnchor(v1.bottomAnchor)
//            ])
        
        let d = ["v2":v2,"v3":v3]
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("H:|[v2]|", options: [], metrics:nil, views: d),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[v2(10)]", options: [], metrics: nil, views: d),
            NSLayoutConstraint.constraintsWithVisualFormat("H:[v3(20)]|", options: [], metrics: nil, views: d),
            NSLayoutConstraint.constraintsWithVisualFormat("V:[v3(20)]|", options: [], metrics: nil, views: d)
            ].flatten().map({$0}))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

