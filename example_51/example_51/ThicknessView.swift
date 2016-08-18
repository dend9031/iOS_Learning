//
//  ThickNessLayer.swift
//  example_51
//
//  Created by Artem Cherkasov on 8/17/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ThicknessView:UIView{
    override class func layerClass()->AnyClass{
        return ThicknessLayer.self
    }
}

class ThicknessLayer:CALayer{
    var thickness:CGFloat = 0
    override class func needsDisplayForKey(key:String)->Bool{
        if key == "thickness"{return true}
        return super.needsDisplayForKey(key)
    }
    
    override func drawInContext(ctx: CGContext) {
        let r = self.bounds.insetBy(dx: 20, dy: 20)
        CGContextSetFillColorWithColor(ctx, UIColor.redColor().CGColor)
        CGContextFillRect(ctx, r)
        CGContextSetLineWidth(ctx, self.thickness)
        CGContextStrokeRect(ctx, r)
    }
}
