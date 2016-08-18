//
//  ViewController.swift
//  example_50
//
//  Created by Artem Cherkasov on 8/17/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button:UIButton!
    @IBOutlet weak var v:UIView!
    @IBOutlet weak var swing:SwingView!
    @IBOutlet weak var animate:AnimateView!
    @IBOutlet weak var lab:UILabel!
    
    var pOrig:CGPoint!
    var iv:UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.pOrig = self.v.center
        let frowney = UIImage(named: "frowney")!
        UIGraphicsBeginImageContextWithOptions(frowney.size, false, 0)
        let empty = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let arr = [frowney,empty,frowney,empty,frowney,frowney,empty]
        iv = UIImageView(image: empty)
        iv.frame.origin = CGPointMake(100, 100)
        self.view.addSubview(iv)
        iv.animationImages = arr
        iv.animationDuration = 2
        iv.animationRepeatCount = 1
        iv.startAnimating()
        
        var arrButton = [UIImage]()
        let w:CGFloat = 18
        for i in 0..<6{
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(w, w), false, 0)
            let context = UIGraphicsGetCurrentContext()!
            CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
            let ii = CGFloat(i)
            CGContextAddEllipseInRect(context, CGRectMake(0+ii, 0+ii, w-ii*2, w-ii*2))
            CGContextFillPath(context)
            let im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            arrButton += [im]
        }
        
        let im = UIImage.animatedImageWithImages(arrButton, duration: 0.5)
        button.setImage(im, forState: .Normal)
        
        self.v.backgroundColor = UIColor.redColor()
        self.swing.backgroundColor = UIColor.orangeColor()
        self.animate.backgroundColor = UIColor.magentaColor()

}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateView(){
        UIView.animateWithDuration(1, animations: {
            self.swing.swing = !self.swing.swing
        })
        
        let animateOpts:UIViewAnimationOptions = .TransitionFlipFromLeft
        self.animate.reverse = !self.animate.reverse
        UIView.transitionWithView(self.animate, duration: 1, options: animateOpts, animations: {
                self.animate.setNeedsDisplay()
            }, completion: nil)
        
        let opts:UIViewAnimationOptions = .TransitionFlipFromTop
        UIView.transitionWithView(self.iv, duration: 0.8, options: opts, animations: {
                self.iv.image = UIImage(named: "frowney")
            }, completion: nil)
        
        
        var p = self.v.center
        let dur = 0.25
        var start = 0.0
        let dx:CGFloat = 100
        let dy:CGFloat = 50
        var dir:CGFloat = 1
        UIView.animateKeyframesWithDuration(4, delay: 0, options: [], animations: {
            UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: dur, animations: {
                p.x += dx*dir ; p.y += dy
                self.v.center = p
            })
            start += dur; dir *= -1
            UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: dur, animations: {
                p.x = dx*dir; p.y += dy
                self.v.center = p
            })
            start += dur; dir *= -1
            UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: dur, animations: {
                p.x += dx*dir; p.y += dy
                self.v.center = p
            })
            start += dur; dir *= -1
            UIView.addKeyframeWithRelativeStartTime(start, relativeDuration: dur, animations: {
                p.x += dx*dir; p.y += dy
                self.v.center = p
            })
            }, completion: nil)
    }
    @IBAction func cancelViewAnimation(){
        UIView.animateWithDuration(0.1,delay: 0, options:.BeginFromCurrentState, animations:{
            self.v.center = self.pOrig
        },completion: nil)
    }
}

