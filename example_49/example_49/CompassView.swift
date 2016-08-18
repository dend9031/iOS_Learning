//
//  CompassView.swift
//  example_49
//
//  Created by Artem Cherkasov on 8/17/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

func delay(delay:Double, closure: ()->()){
    dispatch_after(dispatch_time(
        DISPATCH_TIME_NOW,Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

extension CGRect{
    var center:CGPoint{
        return CGPointMake(CGRectGetMidX(self), CGRectGetMidY(self))
    }
}

class CompassView:UIView{
    override class func layerClass()->AnyClass{
        return CompassLayer.self
    }
}

class  CompassLayer:CALayer{
    var arrow:CALayer?
    var didSetup = false
    
    override func layoutSublayers() {
        if !self.didSetup{
            self.didSetup = true
            self.setup()
        }
    }
    
    func setup(){
        print("setup")
        
        let g = CAGradientLayer()
        g.contentsScale = UIScreen.mainScreen().scale
        g.frame = self.bounds
        g.colors = [
            UIColor.blackColor().CGColor,
            UIColor.redColor().CGColor
        ]
        g.locations = [0.0,1.0]
        self.addSublayer(g)
        
        let circle = CAShapeLayer()
        circle.contentsScale = UIScreen.mainScreen().scale
        circle.lineWidth = 2.0
        circle.fillColor = UIColor(red: 0.9, green: 0.95, blue: 0.93, alpha: 0.9).CGColor
        circle.strokeColor = UIColor.grayColor().CGColor
        let p = CGPathCreateMutable()
        CGPathAddEllipseInRect(p, nil, CGRectInset(self.bounds, 3, 3))
        circle.path = p
        self.addSublayer(circle)
        circle.bounds = self.bounds
        circle.position = self.bounds.center
        
        let pts = "NEWS"
        for (ix,c) in pts.characters.enumerate(){
            let t = CATextLayer()
            t.contentsScale = UIScreen.mainScreen().scale
            t.string = String(c)
            t.bounds = CGRectMake(0, 0, 40, 40)
            t.position = circle.bounds.center
            let vert = circle.bounds.midY/t.bounds.height
            t.anchorPoint = CGPointMake(0.5, vert)
            t.alignmentMode = kCAAlignmentCenter
            t.foregroundColor = UIColor.blackColor().CGColor
            t.setAffineTransform(CGAffineTransformMakeRotation(CGFloat(ix)*CGFloat(M_PI)/2.0))
            circle.addSublayer(t)
        }
        
        let arrow = CALayer()
        arrow.contentsScale = UIScreen.mainScreen().scale
        arrow.bounds = CGRectMake(0, 0, 400, 100)
        arrow.position = self.bounds.center
        arrow.anchorPoint = CGPointMake(0.5, 0.8)
        arrow.delegate = self
        arrow.setAffineTransform(CGAffineTransformMakeRotation(CGFloat(M_PI)/5.0))
        self.addSublayer(arrow)
        arrow.setNeedsDisplay()
        
        self.arrow = arrow
    }
    
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        print("drawLayer:inContext: for arrow")
        
        CGContextMoveToPoint(ctx, 10, 100)
        CGContextAddLineToPoint(ctx, 20, 90)
        CGContextAddLineToPoint(ctx, 30, 100)
        CGContextCopyPath(ctx)
        CGContextAddRect(ctx, CGContextGetClipBoundingBox(ctx))
        CGContextEOClip(ctx)
        
        CGContextMoveToPoint(ctx, 20, 100)
        CGContextAddLineToPoint(ctx, 20, 19)
        CGContextSetLineWidth(ctx, 20)
        CGContextStrokePath(ctx)
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(4, 4), false, 0)
        let imcon = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(imcon, UIColor.redColor().CGColor)
        CGContextFillRect(imcon, CGRectMake(0, 0, 4, 4))
        CGContextSetFillColorWithColor(imcon, UIColor.blueColor().CGColor)
        CGContextFillRect(imcon, CGRectMake(0, 0, 4, 2))
        let stripes = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let stripPattern = UIColor(patternImage: stripes)
        UIGraphicsPushContext(ctx)
        stripPattern.setFill()
        let p = UIBezierPath()
        p.moveToPoint(CGPointMake(0, 25))
        p.addLineToPoint(CGPointMake(20, 0))
        p.addLineToPoint(CGPointMake(40, 25))
        p.fill()
        UIGraphicsPopContext()
    }
}