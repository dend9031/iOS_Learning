//
//  ViewController.swift
//  nibs_examples
//
//  Created by Artem Cherkasov on 8/12/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBAction func buttonPressed(sender:AnyObject){
        let alert = UIAlertController(title: NSLocalizedString("ATtile", comment: "Howdy") , message: NSLocalizedString("AMessage", comment: "You tapped me"), preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Accept", comment: "OK"), style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        let arr = ["hey"] as NSArray
        let i = arr.indexOfObject("ho")
        if i == NSNotFound{
            print("it wasn't found")
        }
        
        let s = "My file"
        let s2 = (s as NSString).stringByAppendingPathExtension("txt")
        print(s2!)
        
        let ss2 = (s as NSString).substringToIndex(4)
        print(ss2)
        
        do{
             let s = "hello"
             let ms = NSMutableString(string:s)
             ms.deleteCharactersInRange(NSMakeRange(ms.length-1, 1))
             let s2 = (ms as String) + "ion"
             print(s2)
        }
        
        do{
            let s = NSMutableString(string:"hello world, go to hell")
            let r = try! NSRegularExpression(
            pattern: "\\bhell\\b",
            options: .CaseInsensitive)
            r.replaceMatchesInString(s, options: [], range: NSMakeRange(0, s.length), withTemplate: "heaven")
            print(s)
        }
        
        do{
            let greg = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian)!
            let comp = NSDateComponents()
            comp.year = 2016
            comp.month = 8
            comp.day = 10
            comp.hour = 15
            let d = greg.dateFromComponents(comp)
            print(d)
            print(d!.descriptionWithLocale(NSLocale.currentLocale()))
        }
        
        do{
            let d = NSDate()
            let comp = NSDateComponents()
            comp.month = 1
            comp.day = 31
            comp.year = -3
            comp.hour = 24
            let greg = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let d2 = greg.dateByAddingComponents(comp, toDate: d, options: [])
            print(d2)
        }
        
        do{
            let df = NSDateFormatter()
            let  format = NSDateFormatter.dateFormatFromTemplate("ddMMMMyyyyhmmaz", options: 0, locale: NSLocale.currentLocale())
            df.dateFormat = format
            let s = df.stringFromDate(NSDate())
            print(s)
        }
        
        do {
            let ud = NSUserDefaults.standardUserDefaults()
            let i = 0
            ud.setInteger(i, forKey: "Score")
            ud.setObject(i, forKey: "Score")
            print(ud)
        }
        
        do{
            let dec1 = NSDecimalNumber(float: 4.0)
            let dec2 = NSDecimalNumber(float: 5.0)
            let sum = dec1.decimalNumberByAdding(dec2)
            print(sum)
        }
        
        do{
             let ud = NSUserDefaults.standardUserDefaults()
             let c = UIColor.blueColor()
             let cdata = NSKeyedArchiver.archivedDataWithRootObject(c)
             ud.setObject(cdata, forKey: "myColor")
        }
        
        do{
            let n1 = NSNumber(integer: 1)
            let n2 = NSNumber(integer: 2)
            print(n1.compare(n2) == .OrderedAscending)
        }
        
        do{
            let arr = ["zero", "one", "two","three","four","five","six","seven","eight","nine","ten"]
            let ixs = NSMutableIndexSet()
            ixs.addIndexesInRange(NSRange(1...4))
            ixs.addIndexesInRange(NSRange(8...10))
            let arr2 = (arr as NSArray).objectsAtIndexes(ixs)
            print(arr2)
        }
        
        do{
            let pep = ["Manny","Moe","Jack"] as NSArray
            let ems = pep.objectsAtIndexes(pep.indexesOfObjectsPassingTest{
                obj, idx, stop in
                return (obj as! NSString).rangeOfString("m",options: .CaseInsensitiveSearch).location == 0
            })
            print(ems)
        }
    }
}
