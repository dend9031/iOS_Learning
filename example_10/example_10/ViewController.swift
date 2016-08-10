//
//  ViewController.swift
//  example_10
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class Dog {
    var whatThisDogSays = "woof"
    func bark(){
        print(self.whatThisDogSays)
    }
}

class Dog2{
    var whatThisDogSays="woof"
    func bark(){
        print(self.whatThisDogSays)
    }
}

func doThis(f:Void->Void){
    f()
}

func imageOfSize(size:CGSize, _ whatToDraw:()->())->UIImage{
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    whatToDraw()
    let result=UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
}

func makeRoundedRectangle(sz:CGSize)->UIImage{
    let image = imageOfSize(sz){
        let p = UIBezierPath(
            roundedRect: CGRect(origin: CGPointZero, size: sz),
            cornerRadius: 8)
        p.stroke()
    }
    return image
}

func makeRoundedRectangleMakerPrelim(sz:CGSize)->()->UIImage{
    func f () -> UIImage{
        let im = imageOfSize(sz){
            let p = UIBezierPath(
                roundedRect: CGRect(origin: CGPointZero, size: sz),
                cornerRadius: 8)
            p.stroke()
        }
        return im
    }
    return f
}

func makeRoundedRectangleMakerPrelim2(sz:CGSize)->()->UIImage{
    func f()->UIImage{
        return imageOfSize(sz){
            let p = UIBezierPath(
                roundedRect: CGRect(origin: CGPointZero, size: sz),
                cornerRadius:8)
            p.stroke()
        }
    }
    return f
}


func makeRoundedRectangleMakerPrelim3(sz:CGSize)->()->UIImage{
    return {
        return imageOfSize(sz){
            let p = UIBezierPath(
                roundedRect: CGRect(origin: CGPointZero, size: sz),
                cornerRadius:8)
            p.stroke()
        }
    }
}


func makeRoundedRectangleMaker(sz:CGSize)->()->UIImage{
    return {
        imageOfSize(sz){
            let p = UIBezierPath(
                roundedRect: CGRect(origin: CGPointZero, size: sz),
                cornerRadius:8)
            p.stroke()
        }
    }
}

func makeRoundedRectangleMaker2(sz:CGSize, _ r:CGFloat)->()->UIImage{
    return {
        imageOfSize(sz){
            let p = UIBezierPath(
                roundedRect: CGRect(origin: CGPointZero, size: sz),
                cornerRadius:r)
            p.stroke()
        }
    }
}


func makeRoundedRectangleMaker3(sz:CGSize) -> (CGFloat)->UIImage{
    return {
        r in
        imageOfSize(sz){
            let p = UIBezierPath(
                roundedRect: CGRect(origin: CGPointZero, size: sz),
                cornerRadius:r)
            p.stroke()
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet var myImageView:UIImageView!
    @IBOutlet weak var myImageView2: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            let d = Dog()
            d.whatThisDogSays = "arf"
            let f = d.bark
            doThis(f)
            
            d.whatThisDogSays = "ruff"
            doThis(f)
        }
        
        do{
            var d = Dog2()
            d.whatThisDogSays = "arf"
            let f = d.bark
            
            doThis(f)
            
            d.whatThisDogSays="ruff"
            doThis(f)
        }
        
        do{
            func drawing(){
                let p = UIBezierPath(roundedRect: CGRectMake(0,0,45,20),cornerRadius:8)
                p.stroke()
            }
            let image = imageOfSize(CGSizeMake(45, 20), drawing)
            _ = image
        }
        
        do{
            let image = imageOfSize(CGSizeMake(45, 20)){
                let p = UIBezierPath(
                    roundedRect: CGRectMake(0, 0, 45, 20),cornerRadius:8)
                p.stroke()
            }
            _ = image
        }
        
        do{
            let sz = CGSizeMake(45, 20)
            let image = imageOfSize(sz){
                let p = UIBezierPath(
                roundedRect: CGRect(origin: CGPointZero,size: sz),cornerRadius: 8)
                p.stroke()
            }
            _ = image
        }
        
        self.myImageView.image = makeRoundedRectangle(CGSizeMake(45, 20))
        
        do{
            let maker = makeRoundedRectangleMakerPrelim(CGSizeMake(45, 20))
            _ = maker
        }
        
        let maker = makeRoundedRectangleMaker(CGSizeMake(45, 20))
        self.myImageView2.image = maker()
        
        let maker2 = makeRoundedRectangleMaker2(CGSizeMake(45, 20), 8)
        _ = maker2
        
        let maker3 = makeRoundedRectangleMaker3(CGSizeMake(45, 20))
        _ = maker3(8)
        
        let image1 = makeRoundedRectangleMaker3(CGSizeMake(45, 20))(8)
        _ = image1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

