//
//  ViewController.swift
//  example_36
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController,FlipsideViewControllerDelegate{

    func flipsideViewControllerDidFinish(controller: FlipsideViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAlternate"{
            if let dest = segue.destinationViewController as? FlipsideViewController{
                dest.delegate = self
            }
        }
    }

}

