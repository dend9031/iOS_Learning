//
//  DetailedViewController.swift
//  example_88
//
//  Created by Artem Cherkasov on 8/24/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    var lab:UILabel!
    var boy:String = ""{
        didSet{
            if self.lab != nil{
                self.lab.text = self.boy
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let lab = UILabel(frame: CGRectMake(100,100,100,30))
        self.view.addSubview(lab)
        self.lab = lab
        self.lab.text = self.boy
    }

}
