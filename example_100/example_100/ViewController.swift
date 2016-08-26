import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    
    @IBAction func doUpdateLabel(sender:AnyObject?){
        let attrString = self.label.attributedText!.mutableCopy() as! NSMutableAttributedString
        let range = (attrString.string as NSString).rangeOfString("^0")
        if range.length > 0 {
            attrString.addAttribute("HERE", value: 1, range: range)
            attrString.replaceCharactersInRange(range, withString: NSDate().description)
        }else{
            attrString.enumerateAttribute("HERE", inRange: NSMakeRange(0, attrString.length), options: []) {
                value,range,stop in
                if let value = value as? Int where value == 1{
                    attrString.replaceCharactersInRange(range, withString: NSDate().description)
                    stop.memory = true
                }
            }
        }
        self.label.attributedText = attrString
    }
}

