import UIKit
import MobileCoreServices

class ViewController: UIViewController {
    @IBOutlet var tf: UITextField!
    let desiredType = kUTTypePlainText as String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tf.allowsEditingTextAttributes = false
    }
    
    @IBAction func doShare(sender:AnyObject){
        self.view.endEditing(true)
        self.showActivityView()
    }
    
    func showActivityView(){
        let things = self.tf.text!
        let avc = UIActivityViewController(activityItems: [things], applicationActivities: nil)
        avc.completionWithItemsHandler = {
            (s:String?, ok:Bool, items:[AnyObject]?, err:NSError?) -> Void in
            if ok{
                guard let items = items where items.count > 0 else{
                    return
                }
                guard let extensionItem  = items[0] as? NSExtensionItem,
                    let provider = extensionItem.attacments?[0] as? NSItemProvider
                    where provider.hasItemConformingToTypeIdentifier(self.desiredType)
                    else{
                        return
                }
            }
        }
    }
}

