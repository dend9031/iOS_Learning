//
//  FlipsideViewController.swift
//  example_36
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

protocol FlipsideViewControllerDelegate:class{
    func flipsideViewControllerDidFinish(controller:FlipsideViewController)
}

class FlipsideViewController:UIViewController{
    weak var delegate:FlipsideViewControllerDelegate!
    
    var timer:CancelableTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Creating timer")
        
        self.timer = CancelableTimer(once:false){
            [unowned self] in
            self.dummy()
        }
        
        print("starting timer")
        self.timer.startWithInterval(1)
    }
    
    func dummy(){
        print("timer fired")
    }
    
    @IBAction func done(sender:AnyObject!){
        print("done")
        self.delegate?.flipsideViewControllerDidFinish(self)
    }
    
    deinit{
        print("deinit")
        self.timer?.cancel()
    }
    
}

extension FlipsideViewController:UIBarPositioningDelegate{
    func positionForBar(bar:UIBarPositioning)->UIBarPosition{
        return .TopAttached
    }
}