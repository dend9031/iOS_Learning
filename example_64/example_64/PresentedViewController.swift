//
//  PresentedViewController.swift
//  example_64
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.magentaColor()
        let button = UIButton(type: .System)
        button.setTitle("Dismiss", forState: .Normal)
        button.addTarget(self, action: #selector(doDismiss), forControlEvents: .TouchUpInside)
        button.sizeToFit()
        button.center = self.view.center
        button.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(button)
    }
    
    func doDismiss(sender:AnyObject?){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
