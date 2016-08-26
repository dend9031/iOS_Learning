import UIKit



func imageOfSize(size:CGSize,closure:()->())->UIImage{
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    closure()
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
}

class ViewController: UIViewController {
    //    @IBOutlet var knob: KnobControl!
    @IBOutlet weak var navBar:UINavigationBar!
    @IBOutlet weak var button:UIButton!
    @IBOutlet weak var button2:UIButton!
    @IBOutlet var segmentedcontoller: UISegmentedControl!
    @IBOutlet var customSgmCnt: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = CGSizeMake(100, 60)
        let image = imageOfSize(size){
            UIImage(named:"linen.png")!.drawInRect(CGRect(origin: CGPoint(), size: size))
            }.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 10, 0, 10),resizingMode: .Stretch)
        self.customSgmCnt.setBackgroundImage(image, forState: .Normal, barMetrics: .Default)
        let pep = ["manny","jack","moe"].map{$0 + ".jpg"}
        for (i,boy) in pep.enumerate(){
            let size = CGSizeMake(30, 30)
            let image = imageOfSize(size){
                UIImage(named: boy)!.drawInRect(CGRect(origin: CGPoint(), size: size))
                }.imageWithRenderingMode(.AlwaysOriginal)
            self.customSgmCnt.setImage(image, forSegmentAtIndex: i)
            self.customSgmCnt.setWidth(80, forSegmentAtIndex: i)
        }
        
        let size2 = CGSizeMake(2, 10)
        let div = imageOfSize(size2){
            UIColor.whiteColor().set()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRect(origin: CGPoint(), size: size2))
        }
        self.customSgmCnt.setDividerImage(div, forLeftSegmentState: .Normal, rightSegmentState: .Normal, barMetrics: .Default)
        
        let image2 = UIImage(named: "coin2.png")!
        let imageSize = image2.size
        let image3 = image2.resizableImageWithCapInsets(UIEdgeInsetsMake(imageSize.height/2, imageSize.width/2, imageSize.height/2, imageSize.width/2))
        self.button.setBackgroundImage(image3, forState: .Normal)
        self.button.backgroundColor = UIColor.clearColor()
        self.button.setImage(image2, forState: .Normal)
        
        let attrStr = NSMutableAttributedString(string: "Pay tribute", attributes: [
            NSFontAttributeName:UIFont(name:"GillSans-Bold",size: 16)!,
            NSForegroundColorAttributeName: UIColor.purpleColor()
            ])
        attrStr.addAttributes([
            NSStrokeColorAttributeName: UIColor.redColor(),
            NSStrokeWidthAttributeName: -2,
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue
            ], range: NSMakeRange(4, attrStr.length - 4))
        self.button.setAttributedTitle(attrStr, forState: .Normal)
        
        let attrStr2 = attrStr.mutableCopy() as! NSMutableAttributedString
        attrStr2.addAttributes([
            NSForegroundColorAttributeName:UIColor.whiteColor()
            ], range: NSMakeRange(0, attrStr2.length))
        self.button.setAttributedTitle(attrStr2, forState: .Highlighted)
        
        self.button.adjustsImageWhenHighlighted = true
        
        self.button2.titleLabel!.numberOfLines = 2
        self.button2.titleLabel!.textAlignment = .Center
        self.button2.setTitle("Button with a title that wraps", forState: .Normal)
        
        let nbsz = CGSizeMake(4, 4)
        self.navBar.shadowImage = imageOfSize(nbsz){
            UIColor.grayColor().colorWithAlphaComponent(0.3).setFill()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(0, 0, 4, 2))
            UIColor.grayColor().colorWithAlphaComponent(0.15).setFill()
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(0, 2, 4, 2))
        }
        
        self.navBar.backIndicatorImage = imageOfSize(CGSizeMake(10, 20)){
            CGContextFillRect(UIGraphicsGetCurrentContext()!, CGRectMake(6, 0, 4, 20))
        }
        
        self.navBar.backIndicatorTransitionMaskImage = imageOfSize(CGSizeMake(10, 20)){}
        
        let b = UIButton(type: .Custom)
        let image4 = imageOfSize(CGSizeMake(15, 15)){
            let gradient = CAGradientLayer()
            gradient.frame = CGRectMake(0, 0, 15, 15)
            gradient.colors = [
                UIColor(red: 1, green: 1, blue: 0, alpha: 0.8).CGColor,
                UIColor(red: 0.7, green: 0.7, blue: 0.3, alpha: 0.8).CGColor
            ]
            let path = UIBezierPath(roundedRect: CGRectMake(0, 0, 15, 15),cornerRadius: 8)
            path.addClip()
            gradient.renderInContext(UIGraphicsGetCurrentContext()!)
            UIColor.blackColor().setStroke()
            path.lineWidth = 2
            path.stroke()
            }.resizableImageWithCapInsets(UIEdgeInsetsMake(7, 7, 7, 7),resizingMode:.Stretch)
        b.setBackgroundImage(image4, forState: .Normal)
        let bb = UIBarButtonItem(customView: b)
        _ = bb
        let ni = UINavigationItem(title:"Tinker")
        let bi = UIBarButtonItem(title: "Evers", style: .Plain, target: self, action: #selector(pushNext))
        ni.rightBarButtonItem = bi
//        ni.leftBarButtonItem = bb
        self.navBar.items = [ni]
    }
    
    func pushNext(sender:AnyObject){
        let oldb = sender as! UIBarButtonItem
        let s = oldb.title!
        let ni = UINavigationItem(title:s)
        if s == "Evers"{
            let b = UIBarButtonItem(title: "Chance", style: .Plain, target: self, action:#selector(pushNext))
            ni.rightBarButtonItem = b
        }
        self.navBar.pushNavigationItem(ni, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1, animations:{
            self.segmentedcontoller.selectedSegmentIndex = 1
        })
        let segmCnt = UISegmentedControl(items:[
            UIImage(named: "moneybag1")!.imageWithRenderingMode(.AlwaysOriginal),
            "Two"
            ])
        segmCnt.frame.origin = CGPointMake(30,60)
        self.view.addSubview(segmCnt)
    }
    
    @IBAction func tapped(g:UIGestureRecognizer){
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
        slider.setValue(value, animated: true)
    }
    //
    //    @IBAction func knobRotate(sender:AnyObject!){
    //        let knob = sender as! KnobControl
    //        print("knob angle is \(knob.angle)")
    //    }
}

