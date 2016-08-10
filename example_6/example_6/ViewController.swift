//
//  ViewController.swift
//  example_6
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//


import UIKit


func say(s:String,times:Int,loudly:Bool){
    var loudly = loudly
    loudly = true
    _ = loudly
}

func removeFromStringNot(s:String,character c:Character) -> Int{
    var s = s
    var howMany = 0
    while let ix = s.characters.indexOf(c){
        s.removeRange(ix...ix)
        howMany+=1
    }
    return howMany
}


func removeFromString(inout s:String,character c:Character)->Int{
    var howMany = 0
    while let ix = s.characters.indexOf(c){
        s.removeRange(ix...ix)
        howMany+=1
    }
    return howMany
}

class Dog{
    var name=""
}

func changeNameOfDog(d:Dog, to tostring:String){
    d.name=tostring
}

class ViewController: UIViewController {
    var button2:UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            let s = "hello"
            let result = removeFromStringNot(s, character:Character("l"))
            print(result)
            print(s)
        }
        
        var ss = "teststrig" {didSet{print("did")}}
        removeFromString(&ss, character:Character("X"))
        
        let rect = CGRectZero
        var arrow = CGRectZero
        var body = CGRectZero
        struct Arrow{
            static let ARHEIGHT:CGFloat = 0
        }
        
        CGRectDivide(rect,&arrow,&body,Arrow.ARHEIGHT, .MinYEdge)
        
        let d = Dog()
        d.name = "Fido"
        print(d.name)
        changeNameOfDog(d, to: "Rover")
        print(d.name)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController:UIPopoverPresentationControllerDelegate{
    func popoverPresentationController(
        popoverPresentationController:UIPopoverPresentationController,
        willRepositionPopoverToRect rect:UnsafeMutablePointer<CGRect>,
                                    inView view:AutoreleasingUnsafeMutablePointer<UIView?>){
        
        view.memory=self.button2
        rect.memory=self.button2.bounds
        
    }
}




