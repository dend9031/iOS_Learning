//
//  SecondViewController.swift
//  example_64
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        let button = UIButton(type: .System)
        button.setTitle("Present", forState: .Normal)
        button.addTarget(self, action: #selector(doPresent), forControlEvents:.TouchUpInside)
        button.sizeToFit()
        button.center = self.view.center
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    class func makePresentedViewController() -> UIViewController{
        let pvc = PresentedViewController()
        pvc.restorationIdentifier = "presented"
        pvc.restorationClass = self
        return pvc
    }
    
    func doPresent(sender:AnyObject?){
        let pvc = self.dynamicType.makePresentedViewController()
        self.presentViewController(pvc, animated: true, completion: nil)
    }
}

extension SecondViewController:UIViewControllerRestoration {
    static func viewControllerWithRestorationIdentifierPath(identifierComponents: [AnyObject], coder: NSCoder) -> UIViewController? {
        var vc: UIViewController? = nil
        let last  = identifierComponents.last as! String
        switch last{
            case "presented":
            vc = self.makePresentedViewController()
        default: break
        }
        return vc
    }
}
