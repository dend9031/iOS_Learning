//
//  ViewController.swift
//  examples_20
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selected:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if self.traitCollection.horizontalSizeClass == .Compact {}
        
        let comp = self.traitCollection.horizontalSizeClass == .Compact
        if comp{}
        
        let what = 0x10
        _ = what
        
        if 3e2 == 300 {
            print("yep")
        }
        
        if 0x10p2 == 64{
            print("yep")
        }
        
        let i = 10
        let x = Double(i)
        print(x)
        let y = 3.8
        let j = Int(y)
        print(j)
        
        do{
            let d: Double = 10
            let n = 3.0
            let nn = 10/3.0
            print(d,n,nn)
        }
        
        let cdub = CDouble(1.2)
        let ti = NSTimeInterval(2.0)
        print(cdub,ti)
        
        do{
            if let mars = UIImage(named:"Mars"){
                let marsCG = mars.CGImage
                let szCG = CGSizeMake(CGFloat(CGImageGetWidth(marsCG)), CGFloat(CGImageGetHeight(marsCG)))
                _ = szCG
            }
        }
        
        do {
            let s = UISlider()
            let g = UIGestureRecognizer()
            
            let pt = g.locationInView(s)
            let percentage = pt.x/s.bounds.size.width
            let delta = Float(percentage)*(s.maximumValue - s.maximumValue)
            
            _ = delta
        }
        
        do{
            var i = UInt8(1)
            let j = Int8(2)
            i = numericCast(j)
            _ = i
        }
        
        do{
            let i = Int.max - 2
            let (j,over) = Int.addWithOverflow(i, 12/2)
            print(j)
            print(over)
        }
        
        do{
            let i = -7
            let j = 6
            print(abs(i))
            print(max(i, j))
        }
        
        do{
            let sq = sqrt(2.0)
            print(sq)
            let n = 10
            let i = Int(arc4random())%n
            print(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

