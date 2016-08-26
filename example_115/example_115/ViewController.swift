import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doButton(sender:AnyObject){
        let url = NSBundle.mainBundle().URLForResource("sunglasses", withExtension: "png")!
//        let things = ["This is cool picture", url]
        let activityViewController = UIActivityViewController(activityItems: [CoolActivity()],applicationActivities: nil)
        activityViewController.completionWithItemsHandler = {
            (s:String?, ok:Bool,items:[AnyObject]?,err:NSError?) -> Void in
            print("completed \(s) \(ok) \(items) \(err)")
        }
        
        activityViewController.excludedActivityTypes = [
            UIActivityTypePostToFacebook,
            UIActivityTypePostToTwitter,
            UIActivityTypePostToWeibo,
            UIActivityTypeMessage,
            UIActivityTypeMail,
            UIActivityTypePrint,
            UIActivityTypeCopyToPasteboard,
            UIActivityTypeAssignToContact,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList,
            UIActivityTypePostToFlickr,
            UIActivityTypePostToVimeo,
            UIActivityTypePostToTencentWeibo,
            UIActivityTypeAirDrop,
            UIActivityTypePostToFacebook,
            UIActivityTypeOpenInIBooks
        ]
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
        if let pop = activityViewController.popoverPresentationController{
            let view = sender as! UIView
            pop.sourceView = view
            pop.sourceRect = view.bounds
            
        }
    }
}


