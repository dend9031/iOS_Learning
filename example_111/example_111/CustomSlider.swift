import UIKit

func delay(delay:Double, closure:()->()){
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

class CustomSlider: UISlider {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(tapGestureRecognizer)
        self.setThumbImage(UIImage(named:"moneybag1.png")!, forState: .Normal)
        let coinEnd = UIImage(named:"coin2.png")!.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 7, 0, 7),resizingMode: .Stretch)
        self.setMaximumTrackImage(coinEnd, forState: .Normal)
        self.setMinimumTrackImage(coinEnd, forState: .Normal)
    }
    
    override func intrinsicContentSize() -> CGSize {
        var size = super.intrinsicContentSize()
        size.height += 30
        return size
    }
    
    func tapped(g:UIGestureRecognizer){
        let slider = g.view as! UISlider
        if slider.highlighted{
            return
        }
        let point = g.locationInView(slider)
        let track = slider.trackRectForBounds(slider.bounds)
        if !CGRectContainsPoint(CGRectInset(track, 0, -10), point){
            return
        }
        let percentage = Float(point.x/slider.bounds.size.width)
        let delta = percentage * (slider.maximumValue - slider.minimumValue)
        let value = slider.minimumValue + delta
        delay(0.1){
            slider.setValue(value, animated: true)
        }
    }
    
    override func maximumValueImageRectForBounds(bounds: CGRect) -> CGRect {
        return super.maximumValueImageRectForBounds(bounds).offsetBy(dx: 31, dy: 0)
    }
    
    override func minimumValueImageRectForBounds(bounds: CGRect) -> CGRect {
        return super.minimumValueImageRectForBounds(bounds).offsetBy(dx: -31, dy: 0)
    }
    
    override func trackRectForBounds(bounds: CGRect) -> CGRect {
        var result = super.trackRectForBounds(bounds)
        result.origin.x = 0
        result.size.width = bounds.size.width
        return result
    }
    
    override func thumbRectForBounds(bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        return super.thumbRectForBounds(bounds, trackRect:rect, value: value).offsetBy(dx: 0, dy: -7)
    }
}


