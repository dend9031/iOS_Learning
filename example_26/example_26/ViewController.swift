//
//  ViewController.swift
//  example_26
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class Dog:NSObject{
    var name:String
    init(_ name:String) {
        self.name = name
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            let arr = ["hey"] as NSArray
            let index = arr.indexOfObject("ho")
            if index == NSNotFound{
                print("it wasn't found")
            }
        }
        
        do{
            let r = NSRange(1...3)
            print(r)
            let r2 = r.toRange()
            print(r2)
        }
        
        do{
            let s = "hello"
            let r = s.rangeOfString("ha")
            if r == nil{
                print("it wasn't found")
            }
        }
        
        do{
            let s = "hello" as NSString
            let r = s.rangeOfString("ha")
            if r.location == NSNotFound{
                print("it wasn't found")
            }
        }
        
        do{
            let s = "hello"
            let s2 = s.capitalizedString
            print(s2)
        }
        
        do{
            let s = "hello"
            let s2 = s.substringToIndex(s.startIndex.advancedBy(4))
            let ss2 = (s as NSString).substringToIndex(4)
            _ = s2
            _ = ss2
        }
        
        do{
            let s = "My file "
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

