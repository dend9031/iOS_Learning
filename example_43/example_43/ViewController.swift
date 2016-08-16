//
//  ViewController.swift
//  example_43
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var didSetup = false

    override func viewDidLayoutSubviews() {
        if self .didSetup{return}
        self.didSetup = true
        
        let mainview = self.view
        
        let v = UIView()
        v.backgroundColor = UIColor.redColor()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        mainview.addSubview(v)
        
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-(0)-[v]-|", options: [], metrics: nil, views: ["v":v]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[v]-|", options: [], metrics: nil, views: ["v":v])
            ].flatten().map{$0})
        
        v.preservesSuperviewLayoutMargins = true
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.greenColor()
        v1.translatesAutoresizingMaskIntoConstraints = false
        
        v.addSubview(v1)
        
        var which:Int{return 2}
        
        switch which{
        case 1:
            NSLayoutConstraint.activateConstraints([
                    NSLayoutConstraint.constraintsWithVisualFormat("H:|-[v1]-|", options: [], metrics: nil, views: ["v1":v1]),
                NSLayoutConstraint.constraintsWithVisualFormat("V:|-[v1]-|", options: [], metrics: nil, views: ["v1":v1])
                ].flatten().map{$0})
        case 2:
            NSLayoutConstraint.activateConstraints([
                v1.topAnchor.constraintEqualToAnchor(v1.layoutMarginsGuide.topAnchor),
                v1.bottomAnchor.constraintEqualToAnchor(v.layoutMarginsGuide.bottomAnchor),
                v1.trailingAnchor.constraintEqualToAnchor(v.layoutMarginsGuide.trailingAnchor),
                v1.leadingAnchor.constraintEqualToAnchor(v.layoutMarginsGuide.leadingAnchor)
                ])
        case 3:
            NSLayoutConstraint.activateConstraints([
                v1.topAnchor.constraintEqualToAnchor(v.readableContentGuide.topAnchor),
                v1.bottomAnchor.constraintEqualToAnchor(v.readableContentGuide.bottomAnchor),
                v1.trailingAnchor.constraintEqualToAnchor(v.readableContentGuide.trailingAnchor),
                v1.leadingAnchor.constraintEqualToAnchor(v.readableContentGuide.leadingAnchor)
                ])
        default:break
        }
    }
}

