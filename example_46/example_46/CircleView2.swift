//
//  CircleView2.swift
//  example_46
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class CircleView2:UIView{
    override func drawRect(rect: CGRect) {
        let con = UIGraphicsGetCurrentContext()
        CGContextAddEllipseInRect(con, CGRectMake(0, 0, 100, 100))
        CGContextSetFillColorWithColor(con, UIColor.blueColor().CGColor)
        CGContextFillPath(con)
    }
}
