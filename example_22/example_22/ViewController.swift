//
//  ViewController.swift
//  example_22
//
//  Created by Artem Cherkasov on 8/11/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

protocol Flier {
    func fly()
}

struct Bird:Flier{
    func fly(){}
    func getWorm(){}
}

struct Bee{
    func fly(){}
}

func tellToFly(f:Flier){
    f.fly()
}

enum Filter:String,CustomStringConvertible{
    case Albums = "Albums"
    case Playlists = "Playlists"
    case Podcasts = "Podcasts"
    case Books = "Audiobooks"
    var description: String {return self.rawValue}
}

func isBird(f:Flier) -> Bool{
    return f is Bird
}

func tellGetWorm(f:Flier){
    (f as? Bird)?.getWorm()
}

struct Insect:Flier{
    func fly(){}
}


class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let b = Bird()
        tellToFly(b)
        let b2 = Bee()
        
        let type:Filter = .Albums
        print(type)
        print("it is \(type)")
        
        let ok = isBird(Bird())
        print(ok)
        let ok2 = isBird(Insect())
        print(ok,ok2)
        
        _ = b2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

