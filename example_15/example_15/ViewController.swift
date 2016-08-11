//
//  ViewController.swift
//  example_15
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

let s:Optional<String> = "howdy"

protocol Flier{
    func flockTogetherWith(f:Self)
}

struct Bird:Flier{
    func flockTogetherWith(f:Bird){}
}

protocol Flier2{
    associatedtype Other
    func flockTogetherWith(f:Self.Other)
    func mateWith(f:Other)
}

struct Bird2 : Flier2{
    func flockTogetherWith(f:Bird2.Other){}
    func mateWith(f:Bird2){}
}

func takeAndReturnSameThing<T> (t:T)-> T{
    return t
}

let thing = takeAndReturnSameThing("howdy")

struct HolderOfTwoSameThings<T>{
    var firstThing:T
    var secondThing:T
    init(thingOne:T,thingTwo:T){
        self.firstThing = thingOne
        self.secondThing = thingTwo
    }
}

let holder = HolderOfTwoSameThings(thingOne: "howdy", thingTwo: "getLost")

func flockTwoTogether<T,U>(f1:T,_ f2:U){}
let vd:Void = flockTwoTogether("hey",1)

protocol SuperFlier3{}

protocol Flier3 : SuperFlier3{
    associatedtype Other:SuperFlier3
    func flockTogetherWith(f:Other)
}

struct Bird3 : Flier3{
    func flockTogetherWith(f:Insect3){}
}

struct Insect3 : Flier3 {
    func flockTogetherWith(f: Insect3) {}
}

func flockTwoTogether2<T:Flier3>(f1:T, _ f2:T){}
let vd2:Void = flockTwoTogether2(Bird3(), Bird3())

func myMin<T:Comparable>(things:T...) -> T {
    var minimum = things[0]
    for i in 1..<things.count{
        if things[i] < minimum{
            minimum = things[i]
        }
    }
    return minimum
}

protocol Flier4{
    associatedtype Other
}

struct Bird4 : Flier4{
    typealias Other = String
}

class Dog<T> {
    var name : T?
}

let d = Dog<String>()

protocol Flier5 {
    init()
}

struct Bird5 : Flier5{
    init(){}
}

struct FlierMaker<T:Flier5>{
    static func makeFlier() -> T {
        return T()
    }
}

let f = FlierMaker<Bird5>.makeFlier()

class NoisyDog:Dog<String>{}
class NoisyDog2<T>:Dog<T>{}

struct Wrapper<T> {}

struct Wrapper2<T>{
    var thing:T
}

class Cat {}
class CalicoCat:Cat{}

protocol Flier6{
    associatedtype Other
    func fly()
}

func flockTwoTogether6<T1:Flier6, T2:Flier6>(f1:T1, _ f2:T2){
    f1.fly()
    f2.fly()
}

class Dog2<T:Dog2>{}

infix operator ^^{}
func ^^(lhs:Int,rhs:Int)->Int{
    var result = lhs
    for _ in 1..<rhs {result *= lhs}
    return result
}

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(2^^2)
        print(2^^3)
        print(3^^3)
        
        let min = myMin(4,1,5,2)
        print(min)
        
        do{
            var w2:Wrapper2<Cat> = Wrapper2(thing: CalicoCat())
            let w3 = Wrapper2(thing: CalicoCat())
            w2 = Wrapper2(thing: CalicoCat())
            
            _ = w2
            _ = w3
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

