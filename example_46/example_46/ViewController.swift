//
//  ViewController.swift
//  example_46
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var iv:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let smiley = UIImage(named: "smiley")!
        let smileyTiled = smiley.resizableImageWithCapInsets(UIEdgeInsetsMake(smiley.size.height/2.0 - 1, smiley.size.width/2.0 - 1, smiley.size.height/2.0 - 1, smiley.size.width/2.0 - 1),resizingMode: .Stretch)
        self.iv.image = smileyTiled
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

