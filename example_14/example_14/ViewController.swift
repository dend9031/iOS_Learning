//
//  ViewController.swift
//  example_14
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

protocol Flier{
}

struct Bird:Flier{
    var name  = "Tweety"
}

struct Insect:Flier {
}

class Dog{
}

class NoisyDog:Dog{
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            var arr = [Int]()
            _ = arr
            arr = []
        }
        
        do{
            var arr:[Int] = []
            _ = arr
            arr = []
        }
        
        do{
            let dogs = [Dog(),NoisyDog()]
            let objs = [1,"howdy"]
            
            let arr:[Flier]=[Insect(),Bird()]
            
            do{
                let arr2:[Flier]=[Insect()]
                _ = arr2
            }
            
            do{
                let arr2:[Flier] = [Insect()]
                let arr3 = arr2.map{$0 as! Insect}
                _ = arr2
                _ = arr3
            }
            
            let rs = Array(1...3)
            print(rs)
            let rs2 = Array(1..<6)
            print(rs2)
            let chars = Array("howdy".characters)
            print(chars)
            let kvs = Array(["hey:no","nonny:nonny no"])
            print(kvs)
            let strings:[String?] = Array(count:100,repeatedValue:nil)
            print(strings)
            let pepBoys = ["Manny","Moe","Jack"]
            pepBoys.forEach{print($0)}
            pepBoys.enumerate().forEach{print("Pep boy \($0.0) is \($0.1)")}
            print(pepBoys.filter{$0.hasPrefix("M")})
            let reducedArr = [1,4,9,13,112]
            let sum = reducedArr.reduce(0, combine:+)
            print(sum)
            
            do{
                let arr = [["Manny","Moe","Jack"],["Hapro","Chico","Groucho"]]
                let target = "m"
                let arr2 = arr.map{
                    $0.filter {
                        let options = NSStringCompareOptions.CaseInsensitiveSearch
                        let found = $0.rangeOfString(target,options: options)
                        return (found != nil)
                    }
                }.filter{$0.count>0}
                print(arr2)
            }
            
            do{
                let arr = ["Manny","Moe","Jack"]
                let s = (arr as NSArray).componentsJoinedByString(",")
                print(s)
            }
            
            do{
                let arr = UIFont.familyNames().map{
                    UIFont.fontNamesForFamilyName($0)
                }
                print(arr)
            }
            
            
            _ = arr
            _ = dogs
            _ = objs
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

