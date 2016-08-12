//
//  MyBoundedLabel.swift
//  nibs_examples
//
//  Created by Artem Cherkasov on 8/12/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class MyBoundedLabel: UILabel {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func drawTextInRect(rect:CGRect){
        let context = UIGraphicsGetCurrentContext()!
        CGContextStrokeRect(context,CGRectInset(self.bounds,1.0,1.0))
        super.drawTextInRect(CGRectInset(rect, 5.0, 5.0))
    }
}
