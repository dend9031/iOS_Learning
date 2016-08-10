//
//  ViewController.swift
//  example_9
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

func doThis(f:()->()){
    f()
}

func sayHowdy() -> String{
    return "Howdy"
}

func performAndPrint(f:()->String){
    let s = f()
    print(s)
}

func imageOfSize(size:CGSize, _ whatToDraw:()->())->UIImage{
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    whatToDraw()
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
}

func test(h:(Int,Int,Int)->Int){
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton2:UIButton!
    @IBOutlet weak var myButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = imageOfSize(CGSizeMake(45, 20),{
            let p = UIBezierPath(roundedRect: CGRectMake(0, 0, 45, 20), cornerRadius: 8)
            p.stroke()
        })
        
        test{
            _ in
            return 0
        }
        
        doThis{
            print("Howdy")
        }
        
        performAndPrint{
            sayHowdy()
        }
        
        let arr = [2,4,6,8]
        
        func doubleMe(i:Int)->Int{
            return i*2
        }
        
        let arr2 = arr.map(doubleMe)
        print(arr2)
        
        let arr3 = arr.map {$0*2}
        print(arr3)
        
    }
    
    @IBAction func doButton(sender:AnyObject){
        UIView.animateWithDuration(0.4, animations:{
                () -> () in
            self.myButton.frame.origin.y += 20
            },completion:{
                (finished:Bool)-> () in
                print("finished: \(finished)")
        })
    }
    
    @IBAction func doButton2(sender:AnyObject){
        UIView.animateWithDuration(0.4, animations: {
            self.myButton2.frame.origin.y += 20
        }){
            print("finished: \($0)")
        }
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

