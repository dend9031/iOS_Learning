//
//  ViewController.swift
//  examples_28
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit
import MediaPlayer

let which = 1


class ViewController: UIViewController {
    
    var observers = Set<NSObject>()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated:Bool){
        super.viewDidAppear(animated)
        
        self.singleTap(self)
        
        let mp = MPMusicPlayerController.systemMusicPlayer()
        mp.beginGeneratingPlaybackNotifications()
        
        switch which{
        case 1:
            NSNotificationCenter.defaultCenter().addObserver(self,
                                                             selector: #selector(nowPlayingItemChanged),
                                                             name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification,
                                                             object: nil)
        case 2:
            let ob = NSNotificationCenter.defaultCenter().addObserverForName(MPMusicPlayerControllerNowPlayingItemDidChangeNotification, object: nil, queue: nil){
                _ in
                print("changed")
            }
            self.observers.insert(ob as! NSObject)
        default: break
        }
    }
    
    func nowPlayingItemChanged(n:NSNotification){
        print("changed")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        switch which {
        case 1:
            NSNotificationCenter.defaultCenter().removeObserver(self)
        case 2:
            for ob in self.observers{
                NSNotificationCenter.defaultCenter().removeObserver(ob)
            }
            self.observers.removeAll()
        default:
          break
        }
    }
    
    func singleTap(_:AnyObject){
        NSNotificationCenter.defaultCenter().postNotificationName("cardTapped", object: self)
    }
}

