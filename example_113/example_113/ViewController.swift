import UIKit

class ViewController: UIViewController {
    var alert2:UIAlertController!
    
    let categoryIdentifier = "coffee"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let alert = UIAlertController(title: "Not So Fast!", message: "Do you really want to do this" +
            "tremendously destructive thing?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: handler))
        alert.addAction(UIAlertAction(title:"Yes",style: .Destructive, handler: handler))
        alert.addAction(UIAlertAction(title: "Maybe", style: .Default, handler: handler))
        alert.preferredAction = alert.actions[2]
        
        alert2 = UIAlertController(title: "Enter a number", message: nil, preferredStyle: .Alert)
        alert2.addTextFieldWithConfigurationHandler{
            (textField:UITextField) in
            textField.keyboardType = .NumberPad
            textField.addTarget(self, action: #selector(self.textChanged), forControlEvents: .EditingChanged)
        }
        alert2.addAction(UIAlertAction(title:"Cancle",style: .Cancel,handler:nil))
        alert2.addAction(UIAlertAction(title:"OK",style: .Default, handler: handlerText))
        
        let alert3 = UIAlertController(title: "Choose new layout", message: nil, preferredStyle: .ActionSheet)
        alert3.addAction(UIAlertAction(title:"Cancel",style: .Cancel,handler: nil))
        for s in ["3 by 3", "4 by 3", "4 by 4","5 by 4","5 by 5"]{
            alert3.addAction(UIAlertAction(title: s, style: .Default, handler: handler))
        }
        self.presentViewController(alert3, animated: true, completion: nil)
    }
    
    func textChanged(sender:AnyObject){
        let textField = sender as! UITextField
        var responder: UIResponder! = textField
        while !(responder is UIAlertController){responder = responder.nextResponder()}
        let alert = responder as! UIAlertController
        alert.actions[1].enabled = (textField.text != "")
        
    }
    
    func handler(action:UIAlertAction){
        print("user tapped \(action.title)")
    }
    func handlerText(action:UIAlertAction){
        let textField = alert2.textFields![0]
        print("user input: \(textField.text)")
    }
    
    @IBAction func doButton(sender:AnyObject){
        self.registeringNotification()
    }
    
    func registeringNotification(){
        if let settings = UIApplication.sharedApplication().currentUserNotificationSettings(){
            if let categories = settings.categories{
                for category in categories{
                    if category.identifier == self.categoryIdentifier{
                        self.createLocalNotification()
                        return
                    }
                }
            }
        }
        
        let types: UIUserNotificationType = [.Alert,.Sound]
        let category = UIMutableUserNotificationCategory()
        category.identifier = self.categoryIdentifier
        
        let action1 = UIMutableUserNotificationAction()
        action1.identifier = "yum"
        action1.title = "Yum"
        action1.destructive = false
        action1.activationMode = .Foreground
        
        let action2 = UIMutableUserNotificationAction()
        var which:Int{return 2}
        switch which {
        case 1:
            action2.identifier = "ohno"
            action2.title = "Oh, No!"
            action2.destructive = false
            action2.activationMode = .Background
        case 2:
            action2.identifier = "message"
            action2.title = "Message"
            action2.activationMode = .Background
            action2.behavior = .TextInput
        default:
            break
        }
        
        category.setActions([action1,action2], forContext: .Default)
        let settings = UIUserNotificationSettings(forTypes: types,categories:[category])
        
        var ob:NSObjectProtocol! = nil
        ob = NSNotificationCenter.defaultCenter().addObserverForName("didRegisterUserNotificationSetting", object: nil, queue: nil){
            _ in
            NSNotificationCenter.defaultCenter().removeObserver(ob)
            self.createLocalNotification()
        }
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }
    
    func createLocalNotification(){
        let ln = UILocalNotification()
        ln.alertBody = "Time for another cup of coffee!"
        ln.category = self.categoryIdentifier
        ln.fireDate = NSDate(timeIntervalSinceNow: 15)
        ln.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(ln)
    }
}

