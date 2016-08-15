//
//  MyViewSwift.swift
//  example_36
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class StringDrawer{
    @NSCopying var attriputedString:NSAttributedString!
    private var mutableAttributedString:NSMutableAttributedString!{
        get{
            if self.attriputedString == nil{return nil}
            return NSMutableAttributedString(attributedString: self.attriputedString)
        }
        set{
            self.attriputedString = newValue
        }
    }
}

class MyView:UIView{
    override func drawRect(rect: CGRect) {
        let con = UIGraphicsGetCurrentContext()!
        let locs:[CGFloat] = [0.0,0.5,1.0]
        let colors:[CGFloat] = [
            0.8,0.4,
            0.1,0.5,
            0.8,0.4,
        ]
        let sp = CGColorSpaceCreateDeviceGray()
        let grad = CGGradientCreateWithColorComponents(sp, colors, locs, 3)
        CGContextDrawLinearGradient(con, grad, CGPointMake(89, 0), CGPointMake(111, 0), [])
    }
}