//
//  ViewController.swift
//  example_31
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button:UIButton!
    @IBOutlet weak var button2:UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.button.addTarget(self, action: #selector(buttonPressed), forControlEvents: .TouchUpInside)
        self.button2.addTarget(nil, action: #selector(buttonPressed), forControlEvents: .TouchUpInside)
    }
    
    @IBAction func buttonPressed(sender:AnyObject){
        let alert = UIAlertController(title: "howdy", message: "You tapped me", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func showResponderChain(sender:UIResponder){
        var r:UIResponder! = sender
        repeat{
            print(r,"\n"); r = r.nextResponder()
        }while r != nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



