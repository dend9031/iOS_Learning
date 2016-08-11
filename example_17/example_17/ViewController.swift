//
//  ViewController.swift
//  example_17
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    lazy var prog: UIProgressView = {
        let p = UIProgressView(progressViewStyle: .Default)
        p.alpha = 0.7
        p.trackTintColor = UIColor.clearColor()
        p.progressTintColor = UIColor.blackColor()
        p.frame = CGRectMake(0, 0, self.view.bounds.size.width, 20)
        p.progress = 1.0
        return p
    }()
    
    private var lazyOncer:dispatch_once_t = 0
    private var lazyBacker: Int = 0
    var lazyFont : Int{
        get{
            dispatch_once(&self.lazyOncer){
                self.lazyBacker = 42
            }
            return self.lazyBacker
        }
        set{
            dispatch_once(&self.lazyOncer){}
            self.lazyBacker = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout = UICollectionViewLayout()
        class MyDynamicAnimator: UIDynamicAnimator{}
        let anim2 = MyDynamicAnimator(collectionViewLayout:layout)
        _ = anim2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

