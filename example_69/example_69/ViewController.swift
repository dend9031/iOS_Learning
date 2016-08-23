//
//  ViewController.swift
//  example_69
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

let TILESIZE : CGFloat = 256

class ViewController: UIViewController {
    @IBOutlet weak var sv : UIScrollView!
    @IBOutlet weak var content:TiledView!


    override func viewDidLoad() {
        let f = CGRectMake(0, 0, 3 * TILESIZE, 3 * TILESIZE)
        let content = TiledView(frame: f)
        let tsz = TILESIZE * content.layer.contentsScale
        (content.layer as! CATiledLayer).tileSize = CGSizeMake(tsz, tsz)
        self.sv.addSubview(content)
        self.sv.contentSize = f.size
        self.content = content
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

class TiledView: UIView{
    let drawQueue = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)
    
    override class func layerClass() -> AnyClass{
        return CATiledLayer.self
    }
    
    override func drawRect(r : CGRect){
        dispatch_sync(drawQueue, {
            NSLog("@%", "drawRect: \(r)")
            
            let tile = r
            let x = Int(tile.origin.x/TILESIZE)
            let y = Int(tile.origin.y/TILESIZE)
            let tileName = String(format: "CuriousFrog_500_\(x+3)_\(y)")
            let path = NSBundle.mainBundle().pathForResource(tileName, ofType: "png")!
            let image = UIImage(contentsOfFile: path)!
            
            image.drawAtPoint(CGPointMake(CGFloat(x) * TILESIZE, CGFloat(y)*TILESIZE))
            
            let bp = UIBezierPath(rect:  r)
            UIColor.whiteColor().setStroke()
            bp.stroke()
        })
    }
}
