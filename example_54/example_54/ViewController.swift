//
//  ViewController.swift
//  example_54
//
//  Created by Artem Cherkasov on 8/18/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var v:UIView!
    
    var tran:CIFilter!
    var moiextent:CGRect!
    var frame:Double!
    
    var timestamp:CFTimeInterval!
    var context:CIContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doButton(sender:AnyObject){
        let moi = CIImage(image: UIImage(named: "moi")!)!
        self.moiextent = moi.extent
        
        let col =  CIFilter(name: "CIConstantColorGenerator")!
        let cicol = CIColor(color: UIColor.orangeColor())
        col.setValue(cicol, forKey: "inputColor")
        let colorimage = col.valueForKey("outputImage") as! CIImage
        
        let tran = CIFilter(name:"FlashTransition")
        tran?.setValue(colorimage, forKey: "inputImage")
        tran?.setValue(moi, forKey: "inputTargetImage")
        let center = CIVector(x:self.moiextent.width/2.0, y:self.moiextent.height/2.0)
        tran?.setValue(center, forKey: "inputCenter")
        
        self.tran = tran
        self.timestamp = 0.0
        self.context = CIContext(options: nil)
        
        dispatch_async(dispatch_get_main_queue()){
            let link = CADisplayLink(target: self, selector: #selector(self.nextFrame))
            link.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        }
    }
    
    let SCALE = 1.0
    
    func nextFrame(sender:CADisplayLink){
        if self.timestamp < 0.01 {
            self.timestamp = sender.timestamp
            self.frame = 0.0
        }else{
            self.frame = (sender.timestamp - self.timestamp) * SCALE
        }
        sender.paused = true
        
        self.tran.setValue(self.frame, forKey: "inputTime")
        let moi = self.context.createCGImage(tran.outputImage!, fromRect: self.moiextent)
        CATransaction.setDisableActions(true)
        self.v.layer.contents = moi
        
        if self.frame > 1.0 {
            print("invalidate")
            sender.invalidate()
        }
        
        sender.paused = false
        
        print("here \(self.frame)")
    }

}

