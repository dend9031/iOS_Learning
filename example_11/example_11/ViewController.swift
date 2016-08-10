//
//  ViewController.swift
//  example_11
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func pass100(f:(Int)->()){
        f(100)
    }
    
    func countAdder(f:()->())->()->(){
    var ct = 0
    return{
        ct = ct + 1
        print("count is \(ct)")
        f()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var x  = 0
        print(x)
        
        func setX(newX:Int){
            x = newX
        }
        
        pass100(setX)
        print(x)
        
        func greet(){
            print("howdy")
        }
        
        let countedGreet = countAdder(greet)
        
        countedGreet()
        countedGreet()
        countedGreet()
        
        do{
            let countedGreet = countAdder(greet)
            let countedGreet2 = countAdder(greet)
            countedGreet()
            countedGreet2()
        }
        
        do{
            let countedGreet = countAdder(greet)
            let countedGreet2 = countedGreet
            countedGreet()
            countedGreet2()

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

