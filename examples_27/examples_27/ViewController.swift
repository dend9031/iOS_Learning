//
//  ViewController.swift
//  examples_27
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

@objc protocol Flier{
    optional var song:String{get}
    optional var song2:String{get}
    optional func sing()
    optional func sing2()->String
}

class Bird:Flier{
    @objc func sing(){
        print("tweet")
    }
    
    @objc func sing2() -> String {
        return "warble"
    }
    
    @objc var song2:String = "gobble gobble"
}

class Insect:Flier{}

protocol Flier2{
    init()
}

class Bird2:Flier2{
    required init(){}
}

final class Bird3:Flier2{
    init(){}
}

class Dog:NSObject{
    var name:String = ""
}

struct Nest:IntegerLiteralConvertible{
    var eggCount:Int = 0
    init(){}
    init(integerLiteral val:Int){
        self.eggCount = val
    }
}

func reportEggs(nest:Nest){
    print("this nest contains \(nest.eggCount) eggs")
}

class ViewController: UIViewController {
    init(){
        super.init(nibName:"ViewController",bundle:nil)
    }
    
    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let d = Dog()
        d.setValue("Fido", forKey: "name")
        print(d.name)
        
        let f:Flier  = Bird()
        let s = f.song
        print(s)
        f.sing?()
        let s2 = f.sing2?()
        print(s2)
        
        do {
            let i:Flier = Insect()
            let s = i.song
            print(s)
            i.sing?()
            let s2 = i.sing2?()
            print(s2)
        }
        
        reportEggs(4)
    }
    
    func f(f:protocol<CustomStringConvertible,CustomDebugStringConvertible>){}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

