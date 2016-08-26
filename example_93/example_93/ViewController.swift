
import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doDynamicType(nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(doDynamicType), name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
        let font = UIFont(name:"Avenir", size: 15)!
        let fontDescriptor = font.fontDescriptor()
        let fontDescriptorWithSymbolicTraits = fontDescriptor.fontDescriptorWithSymbolicTraits(.TraitItalic)
        let font2 = UIFont(descriptor: fontDescriptorWithSymbolicTraits, size: 0)
        print(font)
        print(fontDescriptor)
        print(fontDescriptorWithSymbolicTraits)
        print(font2)
    }
    
    let which = 2
    
    func doDynamicType(n:NSNotification!){
        var fbody:UIFont!
        var femphasis: UIFont!
        
        switch which {
        case 1:
            let body = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleBody)
            let emphasis = body.fontDescriptorWithSymbolicTraits(.TraitItalic)
            fbody = UIFont(descriptor: body,size: 0)
            femphasis = UIFont(descriptor: emphasis, size: 0)
        case 2:
            let body = UIFont(name: "GillSans", size: 15)!
            let emphasis = body.fontDescriptor().fontDescriptorWithSymbolicTraits(.TraitItalic)
            fbody = body
            femphasis = UIFont(descriptor: emphasis, size: 0)
        case 3:
            let body = UIFont(name: "GillSans", size: 15)!
            let result = CTFontCreateCopyWithSymbolicTraits(body as CTFont, 0, nil, .ItalicTrait, .ItalicTrait)!
            fbody = body
            femphasis = result as UIFont
        default:
            break
        }
        
        let s = self.label.text!
        let mas = NSMutableAttributedString(string: s, attributes: [NSFontAttributeName:fbody])
        mas.addAttribute(NSFontAttributeName, value: femphasis, range: (s as NSString).rangeOfString("wild"))
    }
}

