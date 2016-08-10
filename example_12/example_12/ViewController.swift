//
//  ViewController.swift
//  example_12
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var doThis = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let arr = [1 as AnyObject, "howdy" as AnyObject]
        let thing = arr[0]
        _ = thing
        
        let opts:UIViewAnimationOptions = [.Autoreverse,.Repeat]
        _ = opts
        
        if doThis{
            let asset = AVAsset()
            let track = asset.tracks[0]
            let duration: CMTime = track.timeRange.duration
            _ = duration
        }
    }
    
    func conditionalInitializeExample(val:Int){
        let timed:Bool
        if val == 1{
            timed = true
        }else{
            timed = false
        }
        
        _ = timed
    }
    
    func computedInitilizerExample(val:Int){
        let timed:Bool = {
            if val == 1{
                return true
            } else{
                return false
            }
        }()
        _ = timed
    }
    
    func btiExample(){
        do{
            var bti: UIBackgroundTaskIdentifier = 0
            bti = UIApplication.sharedApplication()
                .beginBackgroundTaskWithExpirationHandler({
                    UIApplication.sharedApplication().endBackgroundTask(bti)
                })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

