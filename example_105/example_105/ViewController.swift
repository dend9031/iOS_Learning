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
            paragraph.lineBreakMode = .ByWordWrapping
            },range:NSMakeRange(0,1))
        
        let r = self.textView.frame
        let layoutManager = CustomLayoutManager()
        let textStrorage = NSTextStorage()
        textStrorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size:r.size)
        
        layoutManager.addTextContainer(textContainer)
        let tv = UITextView(frame: r,textContainer: textContainer)
        self.textView.removeFromSuperview()
        self.view.addSubview(tv)
        self.textView = tv
        
        self.textView.attributedText = attrString
        self.textView.scrollEnabled = true
        self.textView.backgroundColor = UIColor.yellowColor()
        self.textView.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20)
        self.textView.selectable = false
        self.textView.editable = false
        
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
                NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[tv]-(10)-|", options: [], metrics: nil, views: ["tv":self.textView]),
            NSLayoutConstraint.constraintsWithVisualFormat("V:[top][tv]-(10)-[bot]|", options: [], metrics: nil, views:["tv":self.textView,"top": self.topLayoutGuide, "bot": self.bottomLayoutGuide ])
            ].flatten().map{$0})
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.textView.contentOffset = CGPointZero
    }

    @IBAction func doTest(sender:AnyObject){
        let offset = self.textView.contentOffset
        let top = self.textView.textContainerInset.top
        var tctopleft = CGPointMake(0, offset.y - top)
        
        var index = self.textView.layoutManager.glyphIndexForPoint(tctopleft, inTextContainer: self.textView.textContainer, fractionOfDistanceThroughGlyph: nil)
        let fragment = self.textView.layoutManager.lineFragmentRectForGlyphAtIndex(index, effectiveRange: nil)
        if tctopleft.y > fragment.origin.y + 0.5 * fragment.size.height{
            tctopleft.y += fragment.size.height
            index = self.textView.layoutManager.glyphIndexForPoint(tctopleft, inTextContainer: self.textView.textContainer, fractionOfDistanceThroughGlyph: nil)
        }
        let charRange = self.textView.layoutManager.characterRangeForGlyphRange(NSMakeRange(index, 0), actualGlyphRange: nil)
        index = charRange.location
        
        let sch = NSLinguisticTagSchemeTokenType
        let t = NSLinguisticTagger(tagSchemes:[sch],options: 0)
        t.string = self.textView.text
        var range:NSRange = NSMakeRange(0, 0)
        let tag = t.tagAtIndex(index, scheme: sch, tokenRange: &range, sentenceRange: nil)
       let layoutManager = self.textView.layoutManager as! CustomLayoutManager
        layoutManager.wordRange = range
        layoutManager.invalidateDisplayForCharacterRange(range)
    }
}

