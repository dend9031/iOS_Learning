import UIKit

func lend<T where T:NSObject>(closure:(T)->())->T{
    let orig = T()
    closure(orig)
    return orig
}

class ViewController: UIViewController,UITextViewDelegate {
    @IBOutlet var textView:UITextView!
    var keyBoardShowing = false
    
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
        
        self.textView.attributedText = attrString
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardShow), name: UIKeyboardWillShowNotification, object: nil)
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardHide), name: UIKeyboardWillHideNotification, object: nil)
        
        self.textView.keyboardDismissMode = .OnDrag
    }
    
    override func shouldAutorotate() -> Bool {
        return !self.keyBoardShowing
    }
    
    func keyboardShow(n:NSNotification){
        let d = n.userInfo!
        var rect = (d[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        rect = self.textView.convertRect(rect, toView: nil)
        self.textView.contentInset.bottom = rect.size.height
        self.textView.scrollIndicatorInsets.bottom = rect.size.height
        
        self.keyBoardShowing = true
    }
    
    func keyboardHide(n:NSNotification){
        self.textView.contentInset = UIEdgeInsetsZero
        self.textView.scrollIndicatorInsets = UIEdgeInsetsZero
        
        self.keyBoardShowing = false
    }
    
    func doDone(sender:AnyObject){
        self.view.endEditing(false)
    }
}

