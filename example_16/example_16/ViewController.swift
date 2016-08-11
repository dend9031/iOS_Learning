//
//  ViewController.swift
//  example_16
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    func flag(country:String) -> String{
        let base:UInt32 = 12937
        var s = ""
        country.unicodeScalars.forEach{s.append(UnicodeScalar(base+$0.value))}
        return s
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            let greeting = "hello"
            print(greeting)
            let leftTripleArrow = "\u{21DA}"
            print(leftTripleArrow)
            let n = 5
            let s = "You have \(n) widgets"
            print(s)
        }
        
        do {
            let m = 4
            let n = 5
            let s = "You have \(m+n) widgests"
            print(s)
        }
        
        do{
            let ud = NSUserDefaults.standardUserDefaults()
            let n = ud.integerForKey("widgets")
            let s = "You have \(n) widgets"
            print(s)
        }
        
        do {
          var s = "hello"
          let s2 = " world"
          s.appendContentsOf(s2)
          print(s)
        }
        
        do {
            let s = "hello"
            let s2 = "world"
            let space = " "
            let greeting = [s,s2].joinWithSeparator(space)
            print(greeting)
        }
        
        do{
            print("hello".hasPrefix("he"))
            print("hello".hasSuffix("lo"))
        }
        
        do{
            let i = 7
            let s = String(i)
            print(s)
        }
        
        do{
            let i = 31
            let s = String(i,radix:8)
            print(s)
        }
        
        do{
            let s = "37"
            let i = Int(s,radix:8)
            print(i)
        }
        
        do{
            let s = "hello"
            let length = s.characters.count
            print(length)
        }
        
        do{
            let s = "hello"
            s.characters.forEach{print($0)}
        }
        
        do{
            let s = "\u{BF}Qui\u{E9}n?"
            print(s)
            s.utf8.forEach{print($0)}
            print("---")
            s.utf16.forEach{print($0)}
            do{
                let s = flag("DE")
                print(s)
            }
        }
        
       print("hello world".capitalizedString)
        
       do{
         let s = "hello"
         let range = s.rangeOfString("ell")
         print(range)
       }
        
        do{
            let s = "hello"
            let ss = (s as NSString).substringWithRange(NSMakeRange(1, 3))
            print(ss)
        }
        
       do{
            let s = "hello"
            let range = (s as NSString).rangeOfString("ell")
            print(range)
        }
        
        do{
            "hello".characters.forEach{print($0)}
        }
        
        do {
            print(Character("h"))
            print(String(Character("h")).uppercaseString)
        }
        
        do{
            let s = "hello"
            print(s.characters.first,s.characters.last)
        }
        
        do{
            let s = "hello"
            print(s.characters.indexOf("l"))
            print(String(s.characters.reverse()).characters.indexOf("l"))
            
        }
        
        do{
            let s = "hello"
            print(s.characters.indexOf{$0<"f"})
            print(s.characters.contains("o"))
            print(s.characters.contains{"aeiou".characters.contains($0)})
            print(s.characters.startsWith("hell".characters))
            print(String(s.characters.dropFirst()))
            print(String(s.characters.prefix(4)))
            let i = s.startIndex
            print(s[i.advancedBy(1)])
            print(s[i.successor()])
            var ss = "hello"
            let ii = ss.startIndex.advancedBy(1)
            ss.insertContentsOf("ey, h".characters, at: ii)
            print(ss)
        }
        
        
        do{
            let s = "hello world"
            let arra = s.characters.split{$0 == " "}
            print(arra)
            let arr = s.characters.split{$0 == " "}.map{String($0)}
            print(arr)
        }
        
        do{
            let s = "Ha\u{030A}kon"
            print(s.characters.count)
            let length = (s as NSString).length
            let length2 = s.utf16.count
            print(length,length2)
        }
        
        do {
            for i in 1...3{
                print(i)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

