import UIKit

class KnobControl: UIControl {
    var angle:CGFloat = 0 {
        didSet{
            if self.angle < 0{
                self.angle = 0
            }
            if angle > 30{
                self.angle = 30
            }
            self.transform = CGAffineTransformMakeRotation(self.angle)
        }
    }
    var continuous = false
    private var initAngle:CGFloat = 0
    
    func pToA(touch:UITouch) -> CGFloat{
        let loc = touch.locationInView(self)
        let c = CGPointMake(self.bounds.midX, self.bounds.midY)
        return atan2(loc.y - c.y, loc.x - c.x)
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        self.initAngle = pToA(touch)
        return true
    }
    
    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        let ang = pToA(touch) - self.initAngle
        let absoluteAngle = self.angle + ang
        switch absoluteAngle {
        case -CGFloat.max...0:
            self.angle = 0
            self.sendActionsForControlEvents(.ValueChanged)
            return false
        case 30...CGFloat.max:
            self.angle = 30
            self.sendActionsForControlEvents(.ValueChanged)
            return false
        default:
            self.angle = absoluteAngle
            if self.continuous{
                self.sendActionsForControlEvents(.ValueChanged)
            }
             return true
        }
    }
    
    override func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
        self.sendActionsForControlEvents(.ValueChanged)
    }
    
    override func drawRect(rect: CGRect) {
        UIImage(named:"knob.png")!.drawInRect(rect)
    }
}
