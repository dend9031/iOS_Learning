//
//  SmileView.swift
//  example_45
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class SmileView:UIView{
    var image:UIImage!
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        if var img = self.image{
            if let asset = self.image.imageAsset{
                let tc = self.traitCollection
                img = asset.imageWithTraitCollection(tc)
            }
            img.drawAtPoint(CGPointZero)
        }
    }
}


