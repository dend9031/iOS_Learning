//
//  ViewController.swift
//  example_73
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sv:UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let iv = UIImageView(image:UIImage(named:"smiley_2.png"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        self.sv.addSubview(iv)
        let sup = self.sv.superview!
        NSLayoutConstraint.activateConstraints([
                iv.centerXAnchor.constraintEqualToAnchor(sup.centerXAnchor, constant: -5),
                iv.topAnchor.constraintEqualToAnchor(sup.topAnchor, constant: 25)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

