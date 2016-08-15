//
//  ViewController.swift
//  example_34
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class MainViewController:UIViewController,FlipsideViewControllerDelegate{
    func flipsideViewControllerDidFinish(controller: FlipsideViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="showAlternate"{
            if let dest  = segue.destinationViewController as? FlipsideViewController{
                dest.delegate = self
            }
        }
    }
}

