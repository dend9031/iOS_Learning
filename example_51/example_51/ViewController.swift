//
//  ViewController.swift
//  example_51
//
//  Created by Artem Cherkasov on 8/17/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var v:ThicknessView!
    @IBOutlet weak var v2:UIView!
    
    var shape:CAShapeLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.v.backgroundColor = UIColor.redColor()
        
        let shape = CAShapeLayer()
        shape.frame = v.bounds
        v2.layer.addSublayer(shape)
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = UIColor.redColor().CGColor
        let path = CGPathCreateWithRect(shape.bounds, nil)
        shape.path = path
        let path2 = CGPathCreateWithEllipseInRect(shape.bounds, nil)
        let ba = CABasicAnimation(keyPath:"path")
        ba.duration = 1
        ba.fromValue = path
        ba.toValue = path2
        shape.speed = 0
        shape.addAnimation(ba, forKey: nil)
        self.shape = shape
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animate(){
        let which = 1
        switch which{
        case 1:
         CATransaction.setDisableActions(true)
         self.v.layer.position.y += 100
         let anim = CASpringAnimation(keyPath: "position")
         anim.damping = 0.7
         anim.initialVelocity = 20
         anim.mass = 0.04
         anim.stiffness = 4
         anim.duration = 0.8
         self.v.layer.addAnimation(anim, forKey: nil)
        case 2:
            let layer = self.v.layer as! ThicknessLayer
            let cur = layer.thickness
            let val:CGFloat = cur == 10 ? 0 : 10
            layer.thickness = val
            let ba = CABasicAnimation(keyPath: "thickness")
            ba.fromValue = cur
            layer.addAnimation(ba, forKey: nil)
        default:break
        }
    }
    
    @IBAction func doSlider(sender:AnyObject){
        let slider = sender as! UISlider
        self.shape.timeOffset = Double(slider.value)
    }

}

