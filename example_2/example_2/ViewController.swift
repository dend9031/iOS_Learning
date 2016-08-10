//
//  ViewController.swift
//  example_2
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

func sum (x:Int, _ y:Int)->Int{
    let result = x+y
    return result
}

func say1(s:String)->Void{print(s)}
func say2(s:String)->(){print(s)}
func say3(s:String){print(s)}

func greet1(unused:Void)->String {return "howdy"}
func greet2() -> String {return "howdy"}

func greeet1(unused:Void)->Void{print("howdy")}
func grreeet2()-> () {print("howdy")}
func greeet3(){ print("howdy")}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let _ = sum(4,5)
        
        let x = 4
        let y = 5
        
        let z = sum(y,x)
        
        print(z)
        
        sum(4,5)
        
        let z2 = sum(4,sum(5,6))
        
        print(z2)
        
        say1("howdy")
        say2("howdy")
        say3("howdy")
        greet1()
        greet2()
        greeet1()
        grreeet2()
        greeet3()
        
        let pointless:Void = say1("howdy")
        print("pointless is \(pointless)")
        
        let v:Void = ()
        greet1(v)
        greet2(v)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

