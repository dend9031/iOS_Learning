//
//  FirstViewController.swift
//  example_61
//
//  Created by Artem Cherkasov on 8/19/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doPresent(sender:AnyObject?){
        let vc = ExtraViewController(nibName: "ExtraViewController", bundle: nil)
        self.definesPresentationContext = true
        self.providesPresentationContextTransitionStyle = true
        self.modalTransitionStyle = .CoverVertical
        vc.modalTransitionStyle = .FlipHorizontal
        vc.modalPresentationStyle = .CurrentContext
        self.presentViewController(vc, animated: true, completion: nil)
    }

}

