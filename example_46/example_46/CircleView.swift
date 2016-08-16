//
//  CircleView.swift
//  example_46
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class CircleView:UIView{
    override func drawRect(rect: CGRect) {
        let p = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
        UIColor.blueColor().setFill()
        p.fill()
    }
}
