//
//  ViewController.swift
//  example_19
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class Dog {}
class NoisyDog:Dog{}

extension Dictionary{
    mutating func addEntriesFormDictionary(d:[Key:Value]){
        for (k,v) in d{
            self[k] = v
        }
    }
}

class ViewController: UIViewController {
    
    var progress = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            let d = [String:String]()
            var d2 = ["CA":"California", "NY":"New Yourk"]
            let d3:[String:String] = [:]
            
            let state = d2["CA"]
            d2["CA"] = "Cassablanca"
            d2["MD"] = "Maryland"
            d2["NY"] = nil
            
            _ = d
            _ = d3
            print(state)
            print(d2)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

