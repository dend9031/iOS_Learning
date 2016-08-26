import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named:"cup.png")?.imageWithRenderingMode(.AlwaysTemplate)
    }
    
    @IBAction func doButton(sender:AnyObject){
        let v = sender as! UIView
        let comp = NSURLComponents()
        comp.scheme = "coffetime"
        comp.host = String(v.tag)
        if let url = comp.URLRelativeToURL(nil){
            self.extensionContext?.openURL(url, completionHandler: nil)
        }
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 16, 0, 16)
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.NewData)
    }
    
}
