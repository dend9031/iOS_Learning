import UIKit

func lend<T where T:NSObject>(closure:(T)->())->T{
    let orig = T()
    closure(orig)
    return orig
}

class ViewController: UIViewController {
    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("brillig", ofType: "txt")!
        let s = try! String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        let s2 = s.stringByReplacingOccurrencesOfString("\n", withString: "")
        let attrString = NSMutableAttributedString(string: s2, attributes: [
            NSFontAttributeName: UIFont(name:"GillSans", size:20)!
            ])
        
        attrString.addAttribute(NSParagraphStyleAttributeName,value:lend(){
            (paragraph:NSMutableParagraphStyle) in
            paragraph.alignment = .Left
            paragraph.hyphenationFactor = 1
            paragraph.lineBreakMode = .ByWordWrapping
            },range:NSMakeRange(0,1))
        
        self.textView.attributedText = attrString
        
        self.textView.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 0)
        self.textView.scrollEnabled = false
    }

    override func viewDidLayoutSubviews() {
        let sz = self.textView.textContainer.size
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(sz.width/4.0, 0))
        path.addLineToPoint(CGPointMake(sz.width, 0))
        path.addLineToPoint(CGPointMake(sz.width, sz.height))
        path.addLineToPoint(CGPointMake(sz.width/4.0, sz.height))
        path.addLineToPoint(CGPointMake(sz.width, sz.height/2.0))
        path.closePath()
        self.textView.textContainer.exclusionPaths = [path]
    }
}

