//
//  ViewController.swift
//  example_18
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class Dog {
    class var whatDogsSays:String{
        return "Woof"
    }
    func bark(){
        print(self.dynamicType.whatDogsSays)
    }
}

class NoisyDog:Dog{
    override class var whatDogsSays:String{
        return "Woof woof woof"
    }
}

func typeExpecter(whattype:Dog.Type){}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let d = Dog()
        d.bark()
        let nd = NoisyDog()
        nd.bark()
        print(nd.dynamicType)
        
        typeExpecter(Dog)
        typeExpecter(Dog.self)
        typeExpecter(d.dynamicType)
        typeExpecter(d.dynamicType.self)
        typeExpecter(nd.dynamicType)
        typeExpecter(nd.dynamicType.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

