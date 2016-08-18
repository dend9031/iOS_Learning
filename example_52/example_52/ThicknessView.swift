//
//  ThicknessView.swift
//  example_52
//
//  Created by Artem Cherkasov on 8/18/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ThicknessView:UIView{
    override class func layerClass()->AnyClass{
        return ThicknessLayer.self
    }
}

class ThicknessLayer:CALayer{
    @NSManaged var thickness:CGFloat
 
    override func actionForKey(event: String) -> CAAction? {
        if event == "thickness"{
            let basicAnim = CABasicAnimation(keyPath: event)
            basicAnim.fromValue = (self.presentationLayer() as! CALayer).valueForKey(event)
            return basicAnim
        }
        return super.actionForKey(event)
    }
}
