//
//  ViewController.swift
//  example_55
//
//  Created by Artem Cherkasov on 8/18/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class EllipseImageView:UIImageView{
    override var collisionBoundsType:UIDynamicItemCollisionBoundsType{
        return .Ellipse
    }
}

class ViewController: UIViewController {
    var anim:UIDynamicAnimator!
    @IBOutlet weak var iv:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.anim = UIDynamicAnimator(referenceView: self.view)
        let grav = UIGravityBehavior()
        iv.image = UIImage(named:"smiley")
        self.anim.addBehavior(grav)
        grav.action = {
            let items = self.anim.itemsInRect(self.view.bounds) as! [UIView]
            let index = items.indexOf(self.iv)
            if index == nil{
                delay(0){
                 self.anim.removeAllBehaviors()
                 self.iv.removeFromSuperview()
                }
            }
        }
        grav.addItem(self.iv)
        
        let push = UIPushBehavior(items: [self.iv], mode: .Instantaneous)
        push.pushDirection = CGVectorMake(1, 0)
        self.anim.addBehavior(push)
        
        let coll = UICollisionBehavior()
        coll.collisionMode = .Boundaries
        coll.addBoundaryWithIdentifier("floor",fromPoint: CGPointMake(0, self.view.bounds.maxY),
                                       toPoint: CGPointMake(self.view.bounds.maxX, self.view.bounds.maxY))
        self.anim.addBehavior(coll)
        coll.addItem(self.iv)
        
        let bounce = UIDynamicItemBehavior()
        bounce.elasticity = 0.8
        self.anim.addBehavior(bounce)
        bounce.addItem(self.iv)
        
        let v = UIView(frame: CGRectMake(0,0,50,50))
        v.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(v)
        let v2 = UIView(frame: CGRectMake(200,0,50,50))
        v2.backgroundColor = UIColor.redColor()
        self.view.addSubview(v2)
    
        let a = UIAttachmentBehavior.slidingAttachmentWithItem(v,attachedToItem: v2, attachmentAnchor: CGPointMake(125, 25),axisOfTranslation: CGVectorMake(0, 1))
        a.attachmentRange = UIFloatRangeMake(-200, 200)
        self.anim.addBehavior(a)
        
        let p = UIPushBehavior(items:[v], mode:.Instantaneous)
        p.pushDirection = CGVectorMake(0, 0.1)
        self.anim.addBehavior(p)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

func delay(delay:Double, closure:()->()){
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

