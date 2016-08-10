//
//  ViewController.swift
//  example_4
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

func say(what:String){
}

func say(what:Int){
}

func say() -> String{
    return "one"
}

func say() -> Int{
    return 1
}

func giveMeAString(s:String){
    print("thanks")
}

class ViewController: UIViewController {
    func sayy(what:String){
    }
    @nonobjc func savy(what:Int){
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        say("howdy")
        say(1)
        
        giveMeAString(say())
        let result = say() + "two"
        print(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

