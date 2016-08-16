//
//  ViewController.swift
//  example_47
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainview = self.view
        let blur = UIVisualEffectView(effect: UIBlurEffect(style:.ExtraLight))
        blur.frame = mainview.bounds
        blur.autoresizingMask = [.FlexibleWidth,.FlexibleHeight]
        let vib = UIVisualEffectView(effect:UIVibrancyEffect(forBlurEffect: blur.effect as! UIBlurEffect))
        let lab = UILabel()
        lab.text = "Hello world!"
        lab.sizeToFit()
        vib.frame = lab.frame
        vib.contentView.addSubview(lab)
        vib.center = CGPointMake(blur.bounds.midX, blur.bounds.midY)
        vib.autoresizingMask = [.FlexibleTopMargin,.FlexibleBottomMargin,.FlexibleLeftMargin,.FlexibleRightMargin]
        blur.contentView.addSubview(vib)
        mainview.addSubview(blur)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

