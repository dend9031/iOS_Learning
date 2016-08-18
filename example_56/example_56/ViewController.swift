//
//  ViewController.swift
//  example_56
//
//  Created by Artem Cherkasov on 8/18/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var v:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        v.backgroundColor = UIColor.blueColor()
        let m1 = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        m1.maximumRelativeValue  = 10.0
        m1.minimumRelativeValue = -10.0
        let m2 = UIInterpolatingMotionEffect(keyPath: "center.y", type:.TiltAlongVerticalAxis)
        m2.maximumRelativeValue = 10
        m2.minimumRelativeValue = -10
        let g = UIMotionEffectGroup()
        g.motionEffects = [m1,m2]
        v.addMotionEffect(g)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

