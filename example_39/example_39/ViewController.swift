//
//  ViewController.swift
//  example_39
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
        let v1 = UIView(frame: CGRectMake(113,111,132,194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        mainview.addSubview(v1)
        v1.addSubview(v2)
        v1.transform = CGAffineTransformMake(1, 0, -0.2, 1, 0, 0)
//        v1.transform = CGAffineTransformMakeRotation(25 * CGFloat(M_PI)/180.0)
//        v1.transform = CGAffineTransformMakeScale(1.8, 1)
        
//        v2.transform = CGAffineTransformMakeTranslation(100, 0)
//        v2.transform = CGAffineTransformRotate(v2.transform,46 * CGFloat(M_PI)/180.0)
//        
//        v2.transform = CGAffineTransformMakeRotation(45*CGFloat(M_PI)/180.0)
//        v2.transform = CGAffineTransformTranslate(v2.transform, 100, 0)
        
        let r = CGAffineTransformMakeRotation(45*CGFloat(M_PI)/180.0)
        let t = CGAffineTransformMakeTranslation(100, 0)
        v2.transform = CGAffineTransformConcat(t, r)
//        v2.transform = CGAffineTransformConcat(CGAffineTransformInvert(r), v2.transform)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

