import UIKit

class CustomPopoverBackgroundView: UIPopoverBackgroundView {
    var arrOff:CGFloat
    var arrDir: UIPopoverArrowDirection
    
    static let ARBASE:CGFloat = 20
    static let ARHEIGHT:CGFloat = 20
    
    override class func wantsDefaultContentAppearance() -> Bool{
        return true
    }
    
    override init(frame:CGRect){
        self.arrOff = 0
        self.arrDir = .Any
        super.init(frame: frame)
        self.opaque = false
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override func drawRect(rect: CGRect) {
        let linOrig = UIImage(named: "linen.png")!
        let capw = linOrig.size.width / 2.0 - 1
        let caph = linOrig.size.height / 2.0 - 1
        let lin = linOrig.resizableImageWithCapInsets(UIEdgeInsetsMake(caph, capw, caph, capw),resizingMode: .Tile)
        
        let con = UIGraphicsGetCurrentContext()!
        CGContextSaveGState(con)
        var propX = self.arrowOffset
        let limit:CGFloat = 22.0
        let maxX = rect.size.width/2.0 - limit
        if propX > maxX{
            propX = maxX
        }
        if propX < limit{
            propX = limit
        }
        let type = self.dynamicType
        CGContextTranslateCTM(con, rect.size.width/2.0 + propX - type.ARBASE/2.0, 0)
        CGContextMoveToPoint(con, 0, type.ARHEIGHT)
        CGContextAddLineToPoint(con, type.ARBASE/2.0, 0)
        CGContextAddLineToPoint(con, type.ARBASE, type.ARHEIGHT)
        CGContextClosePath(con)
        CGContextAddRect(con, CGRectMake(0, type.ARHEIGHT, type.ARBASE, 15))
        CGContextClip(con)
        lin.drawAtPoint(CGPointMake(-40, -40))
        CGContextRestoreGState(con)
        
        var arrow = CGRectZero
        var body = CGRectZero
        CGRectDivide(rect, &arrow, &body,type.ARHEIGHT,.MinYEdge)
        lin.drawInRect(body)
    }
    
    override class func contentViewInsets() -> UIEdgeInsets{
        return UIEdgeInsetsMake(20, 20, 20, 20)
    }
    
    override class func arrowBase() -> CGFloat{
        return self.ARBASE
    }
    
    override class func arrowHeight() -> CGFloat{
        return self.ARHEIGHT
    }
    
    override var arrowDirection: UIPopoverArrowDirection{
        get{
            return self.arrDir
        }
        set(value){
            self.arrDir = value
        }
    }
    
    override var arrowOffset: CGFloat{
        get{
            return self.arrOff
        }set(value){
            self.arrOff = value
        }
    }
}
