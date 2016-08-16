//
//  ViewController.swift
//  example_40
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mainview = self.view
        let v1 = UIView(frame: CGRectMake(100,111,132,194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame: CGRectMake(0,0,132,10))
        v2.backgroundColor = UIColor(red: 0.5 , green: 1, blue: 0, alpha: 1)
        let v3 = UIView(frame: CGRectMake(v1.bounds.width - 20,v1.bounds.height-20,20,20))
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        mainview.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        v2.autoresizingMask = .FlexibleWidth
        v3.autoresizingMask = [.FlexibleTopMargin,.FlexibleLeftMargin]
        v1.bounds.size.width += 40
        v1.bounds.size.height -= 50
        v1.frame = mainview.bounds
        v1.autoresizingMask = [.FlexibleHeight,.FlexibleWidth]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

