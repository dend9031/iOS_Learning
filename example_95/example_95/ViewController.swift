import UIKit

func lend<T where T:NSObject>(closure:(T)->())-> T{
    let orig =  T()
    closure(orig)
    return orig
}

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var textView: UITextView!
    
    let which = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.scrollEnabled = false
        var content:NSMutableAttributedString!
        var content2:NSMutableAttributedString!
        
        switch which {
        case 0,1,4,5:
            let s1 = "The Gettysberg Address, as delivered on certain occasion" +
            "(namely Thursday, November 19, 1863) by A. Lincoln"
            content = NSMutableAttributedString(string: s1, attributes: [NSFontAttributeName:UIFont(name:"Arial-BoldMT",size:15)!,
                NSForegroundColorAttributeName: UIColor(red:0.251,green: 0.000,blue:0.502, alpha: 1)
                ])
            let r = (s1 as NSString).rangeOfString("Gettysberg Address")
            content.addAttributes([
                NSStrokeColorAttributeName: UIColor.redColor(),
                NSStrokeWidthAttributeName: -2.0
                ], range: r)
            self.label.attributedText = content
            self.textView.attributedText = content
            self.textView.textContainerInset = UIEdgeInsetsMake(30,0,0,0)
            if which > 0 {fallthrough}
        case 2,3,4,5:
            let s2 = "Fourscore and seven years ago, our fathers brought forth" +
            "upon this continent a new nation, conceived in liberty and dedicated" +
            "to the proposition that all men are created equal."
            content2 = NSMutableAttributedString(string: s2, attributes: [
                NSFontAttributeName: UIFont(name: "HoeflerText-Black", size: 16)!
            ])
            content2.addAttributes([
                NSFontAttributeName: UIFont(name:"HoeflerText-Black", size: 24)!,
                NSExpansionAttributeName: 0.3,
                NSKernAttributeName: -4
                ],range: NSMakeRange(0, 1))
            self.label.attributedText = content2
            self.textView.attributedText = content2
            self.textView.textContainerInset = UIEdgeInsetsMake(30, 0, 0, 0)
            if which > 2 {fallthrough}
        case 3,4,5:
            content2.addAttribute(NSParagraphStyleAttributeName, value:lend{
                (paragraph:NSMutableParagraphStyle) in
                paragraph.headIndent = 10
                paragraph.firstLineHeadIndent = 10
                paragraph.tailIndent = 10
                paragraph.lineBreakMode = .ByWordWrapping
                paragraph.alignment = .Justified
                paragraph.lineHeightMultiple = 1.2
                paragraph.hyphenationFactor = 1.0
                }, range: NSMakeRange(0, 1))
            self.label.attributedText = content2
            self.textView.attributedText = content2
            self.textView.textContainerInset = UIEdgeInsetsMake(20, 0, 0, 0)
            if which > 3{fallthrough}
        case 4,5:
            let end = content.length
            content.replaceCharactersInRange(NSMakeRange(end, 0), withString: "\n")
            content.appendAttributedString(content2)
            self.textView.attributedText = content
            self.label.attributedText = content
            self.textView.textContainerInset = UIEdgeInsetsMake(20, 0, 0, 0)
            if which > 4 {fallthrough}
        case 5:
            let opts: NSAttributedStringEnumerationOptions = .LongestEffectiveRangeNotRequired
            content.enumerateAttribute(NSFontAttributeName, inRange: NSMakeRange(0, content.length), options: opts, usingBlock:{
                value,range, stop in
                let font = value as! UIFont
                if font.pointSize == 15{
                    content.addAttribute(NSFontAttributeName, value: UIFont(name:"Arial-BoldMT",size: 20)!, range:range)
                }
            })
            self.textView.attributedText = content
            self.label.attributedText = content
            self.textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        default:
            break
        }
    }
}

