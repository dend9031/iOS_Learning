//
//  RedButton.swift
//  nibs_examples
//
//  Created by Artem Cherkasov on 8/12/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class RedButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var borderWidth:CGFloat{
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.redColor()
    }
}
