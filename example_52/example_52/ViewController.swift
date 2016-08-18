//
//  ViewController.swift
//  example_52
//
//  Created by Artem Cherkasov on 8/18/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var transitionAnimationView:UIView!
    var layer:CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        transitionAnimationView.layer.contents = UIImage(named:"smiley")!.CGImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let which = 1
    @IBAction func animate(sender:AnyObject?){
        let t = CATransition()
        t.type = kCATransitionPush
        t.subtype = kCATransitionFromBottom
        t.duration = 2
        CATransaction.setDisableActions(true)
        transitionAnimationView.layer.contents = UIImage(named: "smiley")!.CGImage
        transitionAnimationView.layer.addAnimation(t, forKey: nil)
        
    }
}

