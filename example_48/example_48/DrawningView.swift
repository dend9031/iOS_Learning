//
//  DrawningView.swift
//  example_48
//
//  Created by Artem Cherkasov on 8/17/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class DrawingView:UIView{
    init(){
        super.init(frame:CGRectZero)
        self.opaque = false
    }
    
    required init?(coder:NSCoder){
        super.init(coder:coder)
        self.opaque = false
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.opaque = false
    }
    
    let which = 5
    
    override func drawRect(rect: CGRect) {
        switch which {
        case 1:
            let con  = UIGraphicsGetCurrentContext()
            
            CGContextMoveToPoint(con, 100, 100)
            CGContextAddLineToPoint(con, 100, 19)
            CGContextSetLineWidth(con, 20)
            CGContextStrokePath(con)
            
            CGContextSetFillColorWithColor(con, UIColor.redColor().CGColor)
            CGContextMoveToPoint(con, 80, 25)
            CGContextAddLineToPoint(con, 100, 0)
            CGContextAddLineToPoint(con, 120, 25)
            CGContextFillPath(con)
            
            CGContextMoveToPoint(con, 90, 101)
            CGContextAddLineToPoint(con, 100, 90)
            CGContextAddLineToPoint(con, 110, 101)
            CGContextSetBlendMode(con, .Clear)
            CGContextFillPath(con)
        case 2:
            let p = UIBezierPath()
            p.moveToPoint(CGPointMake(100, 100))
            p.addLineToPoint(CGPointMake(100, 19))
            p.lineWidth = 20
            p.stroke()
            
            UIColor.redColor().set()
            p.removeAllPoints()
            p.moveToPoint(CGPointMake(80, 25))
            p.addLineToPoint(CGPointMake(100, 0))
            p.addLineToPoint(CGPointMake(120, 25))
            p.fill()
            
            p.removeAllPoints()
            p.moveToPoint(CGPointMake(90, 101))
            p.addLineToPoint(CGPointMake(100, 90))
            p.addLineToPoint(CGPointMake(110, 101))
            p.fillWithBlendMode(.Clear, alpha: 1.0)
            
        case 3:
            let  con = UIGraphicsGetCurrentContext()
            
            CGContextMoveToPoint(con, 90, 100)
            CGContextAddLineToPoint(con, 100, 90)
            CGContextAddLineToPoint(con, 110, 100)
            CGContextClosePath(con)
            CGContextAddRect(con, CGContextGetClipBoundingBox(con))
            CGContextEOClip(con)
            
            
            CGContextSetFillColorWithColor(con, UIColor.redColor().CGColor)
            CGContextMoveToPoint(con, 80, 25)
            CGContextAddLineToPoint(con, 100, 0)
            CGContextAddLineToPoint(con, 120, 25)
            CGContextFillPath(con)
            
        case 4:
            let con = UIGraphicsGetCurrentContext()
            CGContextSaveGState(con)
            
            CGContextMoveToPoint(con, 90, 100)
            CGContextAddLineToPoint(con, 100, 90)
            CGContextAddLineToPoint(con, 110, 100)
            CGContextClosePath(con)
            CGContextAddRect(con, CGContextGetClipBoundingBox(con))
            CGContextEOClip(con)
            
            CGContextMoveToPoint(con, 100, 100)
            CGContextAddLineToPoint(con, 100, 19)
            CGContextSetLineWidth(con, 20)
            CGContextReplacePathWithStrokedPath(con)
            CGContextClip(con)
            
            let locs:[CGFloat] = [0.0,0.5,1.0]
            let colors:[CGFloat] = [
                0.8,0.4,
                0.1,0.5,
                0.8,0.4
            ]
            let sp = CGColorSpaceCreateDeviceGray()
            let grad = CGGradientCreateWithColorComponents(sp, colors, locs, 3)
            CGContextDrawLinearGradient(con, grad, CGPointMake(89, 0), CGPointMake(111, 0), [])
            CGContextRestoreGState(con)
            CGContextSetFillColorWithColor(con, UIColor.redColor().CGColor)
            CGContextMoveToPoint(con, 80, 25)
            CGContextAddLineToPoint(con, 100, 0)
            CGContextAddLineToPoint(con, 120, 25)
            CGContextFillPath(con)
        case 5:
            let con = UIGraphicsGetCurrentContext()!
            CGContextSetFillColorWithColor(con, UIColor.blueColor().CGColor)
            CGContextFillRect(con, rect)
            CGContextClearRect(con, CGRectMake(0, 0, 30, 30))
        default:
            break
        }
    }
    
    }
