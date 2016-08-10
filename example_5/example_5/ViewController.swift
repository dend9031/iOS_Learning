//
//  ViewController.swift
//  example_5
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class Dog{
    func say(s:String,times:Int=1){
        for _ in 1...times {
            print(s)
        }
    }
}

func doThing (a a:Int = 0, b:Int = 3){}

func sayString(arrayOfStrings:String ...){
    for s in arrayOfStrings {print(s)}
}

func sayString(arrayOfStrings:String ...,times:Int){
    for _ in 1...times{
        for s in arrayOfStrings {print(s)}
    }
}

func say(s:String, times:Int, loudly _:Bool){Dog().say(s,times: times)}
func say2(s:String,times:Int,_:Bool){Dog().say(s,times:times)}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let d = Dog()
        d.say("woof")
        d.say("woof",times:3)
        
        doThing(b:5,a:10)
        
        sayString("hey","ho","nooony nonny no")
        
        sayString("Manny","Moe","Jack",times:3)
        
        print("Manny",3,true)
        
        print("Manny","Moe",separator:",",terminator:",")
        print("Jack")
        say("hi",times: 3,loudly: true)
        say2("hi",times: 3,true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

