import UIKit

class ViewController: UIViewController {
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSBundle.mainBundle().URLForResource("test", withExtension: "rtf")!
        let opts = [NSDocumentTypeDocumentAttribute: NSRTFTextDocumentType]
        var d:NSDictionary? = nil
        let s = try! NSAttributedString(URL: url, options: opts, documentAttributes: &d)
        self.textView.attributedText = s
        self.textView.textAlignment = .Justified
    }
}

