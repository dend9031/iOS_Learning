//
//  SwingView.swift
//  example_50
//
//  Created by Artem Cherkasov on 8/17/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class SwingView:UIView{
    var swing:Bool = false {
        didSet{
            var p = self.center
            p.x = self.swing ? p.x + 100: p.x - 100
            UIView.animateWithDuration(0, animations: {
                self.center = p
            })
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
