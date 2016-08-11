//
//  ViewController.swift
//  example_13
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit
import MediaPlayer

var now: String{
    get{
        return NSDate().description
    }
    set{
        print(newValue)
    }
}

var now2: String {
    return NSDate().description
}



class ViewController: UIViewController {
    
    var mp: MPMusicPlayerController{
        return MPMusicPlayerController.systemMusicPlayer()
    }
    
    
    
    private var _p:String = ""
    var p:String{
        get{
            return self._p
        }
        set{
            self._p = newValue
        }
    }
    
    var s = "whatever"{
        willSet{
            print(newValue)
        }
        didSet{
            print(oldValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        now = "Howdy"
        print(now)
        
        self.s = "Hellow"
        self.s = "Bonjour"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private var myBigDataReal : NSData! = nil
    var myBigData:NSData!{
        set(newData){
            self.myBigDataReal=newData
        }
        get {
            if myBigDataReal == nil{
                let fm = NSFileManager()
                let f = (NSTemporaryDirectory() as NSString).stringByAppendingPathComponent("myBigData")
                if fm.fileExistsAtPath(f){
                    print("loading big data from disk")
                    self.myBigDataReal = NSData(contentsOfFile: f)
                    do{
                        try fm.removeItemAtPath(f)
                        print("deleted big data from disk")
                    }catch{
                        print("Couldn't remove temp file")
                    }
                }
            }
         return self.myBigDataReal
        }
    }


}

