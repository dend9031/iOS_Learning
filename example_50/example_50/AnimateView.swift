//
//  AnimateView.swift
//  example_50
//
//  Created by Artem Cherkasov on 8/17/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class AnimateView:UIView{
    var reverse = false
    
    override func drawRect(rect: CGRect) {
        let f = self.bounds.insetBy(dx: 10, dy: 10)
        let ctx = UIGraphicsGetCurrentContext()!
        if self.reverse{
            CGContextStrokeEllipseInRect(ctx, f)
        }else{
            CGContextStrokeRect(ctx, f)
        }
    }
    
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
}
