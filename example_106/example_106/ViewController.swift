import UIKit
import SafariServices

class ViewController: UIViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    @IBAction func load(){
        let url = NSURL(string: "http://www.apple.com")!
        let safariViewController = SFSafariViewController(URL:url)
        self.presentViewController(safariViewController, animated: true, completion: nil)
    }
}

