import UIKit
import ImageIO

func lend<T where T:NSObject>(closure:(T)->())->T{
    let orig = T()
    closure(orig)
    return orig
}

class ViewController: UIViewController {
    @IBOutlet var textView: UITextView!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let s = "Onions\t$2.34\nPeppers\t$15.2\n"
        let attrString = NSMutableAttributedString(string: s, attributes: [
            NSFontAttributeName: UIFont(name: "GillSans", size: 15)!,
            NSParagraphStyleAttributeName:lend{
                (p:NSMutableParagraphStyle) in
                let terms = NSTextTab.columnTerminatorsForLocale(NSLocale.currentLocale())
                let tab = NSTextTab(textAlignment: .Right, location: 170, options: [
                    NSTabColumnTerminatorsAttributeName:terms
                    ])
                var which:Int{return 2}
                switch which{
                case 1:
                    p.tabStops = [tab]
                case 2:
                    for oldTab in p.tabStops{
                        p.removeTabStop(oldTab)
                    }
                    p.addTabStop(tab)
                default:break
                }
                
                p.firstLineHeadIndent = 20
            }
        ])
        
        self.textView.attributedText = attrString
    
        let onions = self.thumbnailOfImageWithName("onion", withExtension: "jpg")
        let peppers = self.thumbnailOfImageWithName("peppers", withExtension: "jpg")
        
        let onionAttachment = NSTextAttachment()
        onionAttachment.image = onions
        onionAttachment.bounds = CGRectMake(0, -5, onions.size.width, onions.size.height)
        let onionattchar = NSAttributedString(attachment: onionAttachment)
        
        let pepperAttachment = NSTextAttachment()
        pepperAttachment.image = peppers
        pepperAttachment.bounds = CGRectMake(0, -5, peppers.size.width, peppers.size.height)
        let pepperattchar = NSAttributedString(attachment: pepperAttachment)
        
        let r = (attrString.string as NSString).rangeOfString("Onions")
        attrString.insertAttributedString(onionattchar, atIndex: r.location + r.length)
        
        let r2 = (attrString.string as NSString).rangeOfString("Peppers")
        attrString.insertAttributedString(pepperattchar, atIndex: r2.location + r2.length)
        
        attrString.appendAttributedString(NSAttributedString(string: "\n\n",attributes: nil))
        attrString.appendAttributedString(NSAttributedString(string: "LINK", attributes: [
            NSLinkAttributeName: NSURL(string: "http://www.apple.com")!
            ]))
        attrString.appendAttributedString(NSAttributedString(string: "\n\n", attributes: nil))
        attrString.appendAttributedString(NSAttributedString(string: "(805)-123-4567", attributes: nil))
        attrString.appendAttributedString(NSAttributedString(string: "\n\n",attributes: nil))
        attrString.appendAttributedString(NSAttributedString(string: "123 Main Street, Anytown, CA 91234",attributes: nil))
        attrString.appendAttributedString(NSAttributedString(string: "\n\n",attributes: nil))
        attrString.appendAttributedString(NSAttributedString(string: "tommorow at 4 PM",attributes: nil))
        
        self.textView.attributedText = attrString
        
        self.textView.selectable = true
        self.textView.editable = false
        self.textView.delegate = self
    }
    
    func thumbnailOfImageWithName(name:String,withExtension ext:String) -> UIImage{
        let url = NSBundle.mainBundle().URLForResource(name, withExtension: ext)!
        let src = CGImageSourceCreateWithURL(url, nil)!
        let scale = UIScreen.mainScreen().scale
        let w:CGFloat = 20 * scale
        let d:[NSObject:AnyObject] = [
            kCGImageSourceShouldAllowFloat:true,
            kCGImageSourceCreateThumbnailWithTransform:true,
            kCGImageSourceCreateThumbnailFromImageAlways:true,
            kCGImageSourceThumbnailMaxPixelSize: Int(w)
        ]
        let imageReference = CGImageSourceCreateThumbnailAtIndex(src, 0, d)!
        let image = UIImage(CGImage:imageReference,scale:scale,orientation:.Up)
        return image
    }
}

extension ViewController:UITextViewDelegate{
    func textView(textView: UITextView, shouldInteractWithTextAttachment textAttachment: NSTextAttachment, inRange characterRange: NSRange) -> Bool {
        return true
    }
    
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        return true
    }
}

