//
//  CoolActivity.swift
//  example_115
//
//  Created by Artem Cherkasov on 8/26/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

func imageOfSize(size:CGSize,_ opaque:Bool = false,_ closure:()->())->UIImage{
    UIGraphicsBeginImageContextWithOptions(size,opaque,0)
    closure()
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
}

class CoolActivity: UIActivity {
    var items:[AnyObject]?
    var image:UIImage
    
    override init() {
        let idiom = UIScreen.mainScreen().traitCollection.userInterfaceIdiom
        var scale:CGFloat = (idiom == .Pad ? 76:60) - 10
        let image = UIImage(named:"sunglasses.png")!
        let largerSize = fmax(image.size.height, image.size.width)
        scale /= largerSize
        let sz = CGSizeMake(image.size.width * scale, image.size.height * scale)
        self.image = imageOfSize(sz){
            image.drawInRect(CGRect(origin: CGPoint(), size: sz))
        }
        super.init()
    }
    
    override class func activityCategory() -> UIActivityCategory{
        return .Action
    }
    
    override func activityType() -> String? {
        return "mobi.gspd.example-115.coolActivity"
    }
    
    override func activityTitle() -> String? {
        return "Be Cool"
    }
    
    override func activityImage() -> UIImage? {
        return self.image
    }
    
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        self.items = activityItems
    }
    
    override func performActivity() {
        self.activityDidFinish(true)
    }
}
