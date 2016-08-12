//
//  ViewController.swift
//  nibs_examples
//
//  Created by Artem Cherkasov on 8/12/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBAction func buttonPressed(sender:AnyObject){
        let alert = UIAlertController(title: "Howdy!", message: "You tapped me", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
