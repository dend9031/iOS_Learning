//
//  ViewController.swift
//  example_1
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class Dog{
    var name = ""
    var whatADogSays = "woof"
    func bark(){
        print(self.whatADogSays)
    }
    func speak(){
        self.bark()
    }
}

func sum(x:Int, _ y:Int) -> Int{
    let result = x + y
    return result
}

func says1(s:String)->Void{print(s)}
func says2(s:String)->(){print(s)}
func says3(s:String){print(s)}

func greet1(unused:Void)->String{return "howdy"}
func greet2()->String{return "howdy"}

func greeet1(unused:Void)-> Void {print("howdy")}
func greeet2()-> () {print("howdy")}
func greeet3() {print("howdy")}


class Dog2{func bark(){print("woof")}}
    
extension Int{
        func sayHello(){
        print("Hello, I'm \(self)")
        }
    }
func go(){
    let one = 1
    var two = 2
    two = one
    let _ = (one,two)
}

func doGo(){
    go()
}

func silly(){
    if true{
        class Cat{}
        var one = 1
        one = one + 1
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("hello")
        print("world")
        print("hello");print("world")
        print("hello");
        print("world)");
        print(
            "world"
        )
        
        
        let sum = 1 + 2
        let x = 1.successor()
        
        
        1.sayHello()
        
        
        let fido = Dog()
        fido.bark()

        let rover = Dog.init()
        rover.bark()
        
        let dog1 = Dog()
        dog1.name = "Fido"
        var dog2 = Dog()
        dog2.name = "Rover"
        print(dog1.name)
        print(dog2.name)
        dog2 = dog1
        print(dog2.name)
        
        dog1.bark()
        dog2.bark()
        
        let _ = sum(4,5)
        let x1 = 4
        let y1 = 5
        let z1 = sum(y1,x1)
        
        print(z)
        sum(4,5)
    
        let z2 = sum(4,sum(5,6))
        print(z2)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

