import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject,NSExtensionRequestHandling {
    let list:[String] = {
        let path = NSBundle.mainBundle().URLForResource("abbreviations", withExtension: "txt")!
        let s = try! String(contentOfURL:path,encoding: NSUTF8StringEncoding)
        return s.componetsSeparatedByString("\n")
    }()
    
    var extensionContext:NSExtensionContext?
    
    var desiredType = kUTTypePlainText as String
    
    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        self.extensionContext = context
        let items = self.extensionContext!.inputItems
        guard let extensionItem = items[0] as? NSExtensionItem,
            let provider = extensionItem.attacments?[0] as? NSItemProvider
            where provider.hasItemConformingToTypeIdentifier(self.desiredType)
            else{
                return self.processItem(nil)
        }
        provider.loadItemForTypeIdentifier(self.desiredType,option:nil){
            (item:NSSecureCoding?, err:NSError!) -> () in
            dispatch_async(dispatch_get_main_queue()){
                self.processItem(item as? String)
            }
        }
    }
    
    func stateForAbbrev(abbrev:String) -> String?{
        let index = list.indexOf(abbrev.uppercaseString)
        return index != nil ? list[index! + 1] : nil
    }
    
    func stuffEnvelope(item:String) -> [NSExtensionItem]{
        let extensionItem = NSExtensionItem()
        let itemProvider = NSItemProvider(item: item, typeIdentifier: desiredType)
        extensionItem.attachments = [itemProvider]
        return [extensionItem]
    }
    
    func processItem(item:String?){
        var result:[NSExtensionItem]? = nil
        if let item = item,
            let abbrev = self.stateForAbbrev(item){
            result = self.stuffThatEnvelope(abbrev)
        }
        self.extensionContext?.completeRequestReturningItems(result, completionHandler: nil)
        self.extensionContext = nil
    }
}

