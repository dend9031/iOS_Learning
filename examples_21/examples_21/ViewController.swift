//
//  ViewController.swift
//  examples_21
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

func f(i1:Int, _ i2:Int)->(){}
func f2(i1 i1:Int, i2:Int)->(){}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            let pair : (Int,String)=(1,"One")
            _ = pair
        }
        
        do{
            let pair = (1,"One")
            _ = pair
        }
        
        do{
            var i:Int
            var s:String
            (i,s) = (1,"One")
            _ = i ; _ = s
        }
        
        do{
            var s1 = "Hello"
            var s2 = "world"
            (s1,s2) = (s2,s1)
            print(s1,s2)
        }
        
        do{
            let pair = (1,"One")
            let (_,s) = pair
            _ = s
        }
        
        do{
            let s = "hello"
            for(ix,c) in s.characters.enumerate(){
                print("character \(ix) is \(c)")
            }
        }
        
        do{
            var pair = (1,"One")
            let ix = pair.0
            pair.0 = 2
            print(pair)
            _ = ix
        }
        
        do {
            let pair:(first:Int,second:String) = (1,"One")
            _ = pair
        }
        
        do{
            let pair = (first:1, second:"One")
            _ = pair
        }
        
        do{
            var pair = (first:1,second:"One")
            let x = pair.first
            pair.first = 2
            let y = pair.0
            _ = x; _=y
        }
        
        do{
            let pair = (1,"One")
            let pairWithNames:(first:Int,second:String) = pair
            let ix = pairWithNames.first
            _ = pair
            _ = pairWithNames
            _ = ix
        }
        
        do{
            var pairWithoutNames = (1,"One")
            pairWithoutNames = (first:2, second:"Two")
            print(pairWithoutNames)
        }
        
        do{
            func turpleMaker()->(first:Int, second:String){
                return (1,"One")
            }
            let i = turpleMaker().first
            print(i)
        }
        
        do{
            let tuple = (1,2)
            f(tuple)
        }
        
        do {
            let tuple = (i1:1,i2:2)
            f2(tuple)
        }
        
        do{
            var array : [(Int,Int)] = []
            array.append((1,1))
            let int_const = 1
            array.append((int_const,1))
            let const_tuple:(Int,Int) = (1,1)
            array.append(const_tuple)
            var int_var = 1
            array.append((int_var,1))
            print(array)
            var var_tuple:(Int, Int) = (1, 1)
            array.append(var_tuple)
         
            int_var = 0
            var_tuple = (0,0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

