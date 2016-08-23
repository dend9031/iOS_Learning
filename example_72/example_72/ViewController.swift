//
//  ViewController.swift
//  example_72
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

func delay(delay:Double, closure:()->()){
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

class ViewController: UIViewController {
    @IBOutlet var sv:UIScrollView!
    @IBOutlet var flag:UIImageView!
    @IBOutlet weak var map:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sv.contentSize = self.map.bounds.size
    }
    
    @IBAction func dragging(p:UIPanGestureRecognizer){
        let v = p.view!
        switch p.state{
        case .Began, .Changed:
            let delta = p.translationInView(v.superview!)
            v.center.x += delta.x
            v.center.y += delta.y
            p.setTranslation(CGPointZero, inView: v.superview)
            if p.state == .Changed{fallthrough}
        case .Changed:
            let sv = self.sv
            let loc = p.locationInView(sv)
            let f = sv.bounds
            var off = sv.contentOffset
            let sz = sv.contentSize
            var c = v.center
            
            if loc.x > CGRectGetMaxX(f) - 30{
                let margin = sz.width - CGRectGetMaxX(sv.bounds)
                if margin > 6 {
                    off.x += 5
                    sv.contentOffset = off
                    c.x += 5
                    v.center = c
                    self.keepDragging(p)
                }
            }
            
            if loc.x < f.origin.x + 30{
                let margin = off.x
                if margin > 6 {
                    off.x -= 5
                    sv.contentOffset = off
                    c.x -= 5
                    v.center = c
                    self.keepDragging(p)
                }
            }
            
            if loc.y > CGRectGetMaxY(f)-30{
                let margin = sz.height - CGRectGetMaxY(sv.bounds)
                if margin > 6{
                    off.y += 5
                    sv.contentOffset = off
                    c.y += 5
                    v.center = c
                    self.keepDragging(p)
                }
            }
            
            if loc.y < f.origin.y + 30{
                let margin = off.y
                if margin > 6{
                    off.y -= 5
                    sv.contentOffset = off
                    c.y -= 5
                    v.center = c
                    self.keepDragging(p)
                }
            }
        default : break
        }
    }
    
    func keepDragging(p:UIPanGestureRecognizer){
        let del = 0.1
        delay(del){
            self.dragging(p)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

