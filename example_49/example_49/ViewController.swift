//
//  ViewController.swift
//  example_49
//
//  Created by Artem Cherkasov on 8/17/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mainview = self.view
        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1).CGColor
        layer1.frame = CGRectMake(113, 111, 132, 194)
        mainview.layer.addSublayer(layer1)
        let layer2 = CALayer()
        layer2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1).CGColor
        layer2.frame = CGRectMake(41, 56, 132, 194)
        layer1.addSublayer(layer2)
        let iv = UIImageView(image: UIImage(named: "smiley"))
        mainview.addSubview(iv)
        iv.frame.origin = CGPointMake(180, 180)
        let layer3 = CALayer()
        layer3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).CGColor
        layer3.frame = CGRectMake(43, 197, 160, 230)
        mainview.layer.addSublayer(layer3)
        let layer4 = CALayer()
        let im = UIImage(named: "smiley")!
        layer4.frame = CGRect(origin: CGPointMake(180, 180), size: im.size)
        layer4.contents = im.CGImage
//        layer1.transform = CATransform3DMakeRotation(45*CGFloat(M_PI)/180.0, 0, 1, 0)
        mainview.layer.addSublayer(layer4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

