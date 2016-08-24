import UIKit

class ExtraViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "ExtraViewController", bundle: nibBundleOrNil)
        self.modalPresentationStyle = .CurrentContext
        self.preferredContentSize = CGSizeMake(320, 320)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doButton(sender:AnyObject){
        print("extra view controller view frame: \(self.view.frame)")
        self.dismissViewControllerAnimated(true, completion: {
            print("dismissed")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.view.frame = CGRectMake(0, 0, 320, 320)
    }
    
    deinit{
        print("dealloc extra view controller")
    }
}
