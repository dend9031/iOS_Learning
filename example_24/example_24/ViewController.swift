//
//  ViewController.swift
//  example_24
//
//  Created by Artem Cherkasov on 8/12/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

enum Filter{
    case Albums
    case Playlists
    case Podcasts
    case Books
}

func filterExpecter(type:Filter){
    if type == .Albums{
        print("it's albums")
        print(type)
    }
}

enum Filter2:Int{
    case Albums
    case Playlists
    case Podcasts
    case Books
}

enum Filter3:String{
    case Albums = "Albums"
    case Playlists = "Playlists"
    case Podcasts = "Podcasts"
    case Books = "Audiobooks"
}

enum Error{
    case Number(Int)
    case Message(String)
    case Fatal
}

enum Error2{
    case Number(Int)
    case Message(String)
    case Fatal(n:Int,s:String)
}



class ViewController: UIViewController {
    
    var err2:Error2 = .Fatal(n: -12, s: "Oh the horror")
    var s:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let type = Filter.Albums
        let type2:Filter = .Albums
        filterExpecter(.Albums)
        
        let v = UIView()
        v.contentMode = .Center
        
        let type3 = Filter3.Albums
        print(type3.rawValue)
        
        let type4 = Filter3(rawValue: "Albums")
        if type4 == .Albums {print("yep")}
        
        let err:Error = .Number(4)
        let num  = 4
        let errr:Error = .Number(num)
        
        switch err2{
        case .Number(let theNumber):
            print("number :\(theNumber)")
        case .Message(let theMessage):
            print("message \(theMessage)")
        case .Fatal(let theNumber, let theMessage):
            print("number: \(theNumber), message: \(theMessage)")
        }
        
        do{
            let fatalMaker = Error2.Fatal
            let err = fatalMaker(n: -1000, s: "Unbelievably bad error")
            _ = err
        }
        
        switch s{
        case .Some(let theString):
            print(theString)
        case .None:
            print("it's nil")
        }
    
        _ = type
        _ = type2
        _ = err
        _ = errr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

