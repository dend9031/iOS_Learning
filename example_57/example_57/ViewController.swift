//
//  ViewController.swift
//  example_57
//
//  Created by Artem Cherkasov on 8/18/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var v:UIView!
    var longPresser:UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        v.backgroundColor = UIColor.orangeColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func longPress(lp:UILongPressGestureRecognizer){
        switch lp.state{
        case .Began:
            let anim = CABasicAnimation(keyPath:"transform")
            anim.toValue = NSValue(CATransform3D: CATransform3DMakeScale(1.1, 1.1, 1))
            anim.fromValue = NSValue(CATransform3D: CATransform3DIdentity)
            anim.repeatCount = Float.infinity
            anim.autoreverses = true
            lp.view!.layer.addAnimation(anim, forKey: nil)
        case .Ended, .Cancelled:
            lp.view!.layer.removeAllAnimations()
        default: break
        }
    }
    
    @IBAction func dragging(p:UIPanGestureRecognizer){
        let vv = p.view!
        switch p.state {
        case .Began, .Changed:
            let delta  = p.translationInView(vv.superview!)
            var c = vv.center
            c.x += delta.x
            c.y += delta.y
            vv.center = c
            p.setTranslation(CGPointZero, inView: vv.superview)
        default:break
        }
    }
}


