import UIKit

class FlagView:UIImageView{
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let inside = self.pointInside(point, withEvent: event)
        if !inside {return nil}
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        let layer = self.layer
        layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let im = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let info = CGImageAlphaInfo.Only.rawValue
        let pixel = UnsafeMutablePointer<CUnsignedChar>.alloc(1)
        pixel[0] = 0
        let context = CGBitmapContextCreate(pixel, 1, 1, 8, 1, nil, info)!
        UIGraphicsPushContext(context)
        im.drawAtPoint(CGPointMake(-point.x,-point.y))
        UIGraphicsPopContext()
        let p = pixel[0]
        let alpha = Double(p)/255.0
        let transparent = alpha < 0.01
        return transparent ? nil:self
    }
}
