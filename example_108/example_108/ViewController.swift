//
//  ViewController.swift
//  example_108
//
//  Created by Artem Cherkasov on 8/25/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var progressView:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressView.backgroundColor = UIColor.blackColor()
        self.progressView.trackTintColor = UIColor.blueColor()
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(10, 10), true, 0)
        let  graphicsContext = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(graphicsContext, UIColor.yellowColor().CGColor)
        CGContextFillRect(graphicsContext, CGRectMake(0, 0, 10, 10))
        let r = CGRectInset(CGContextGetClipBoundingBox(graphicsContext),1,1)
        CGContextSetLineWidth(graphicsContext, 2)
        CGContextSetStrokeColorWithColor(graphicsContext, UIColor.blackColor().CGColor)
        CGContextStrokeRect(graphicsContext, r)
        CGContextStrokeEllipseInRect(graphicsContext, r)
        let image = UIGraphicsGetImageFromCurrentImageContext()
            .resizableImageWithCapInsets(UIEdgeInsetsMake(4, 4, 4, 4),resizingMode:.Stretch)
        UIGraphicsEndImageContext()
        self.progressView.progressImage = image
    }
}

