//
//  ViewController.swift
//  example_7
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

func countDownFrom(ix:Int){
    print(ix)
    if ix > 0{
        countDownFrom(ix-1)
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        func countDownFrom3(ix:Int){
            print(ix)
            if ix > 0{
                countDownFrom(ix-1)
            }
        }
        
        countDownFrom(5)
        countDownFrom(5)
        countDownFrom(5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

