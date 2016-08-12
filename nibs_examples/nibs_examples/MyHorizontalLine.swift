//
//  MyHorizontalLine.swift
//  nibs_examples
//
//  Created by Artem Cherkasov on 8/12/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class MyHorizontalLine: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        let c = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(c, 0, 0)
        CGContextAddLineToPoint(c, self.bounds.size.width, 0)
        CGContextStrokePath(c)
    }
}
