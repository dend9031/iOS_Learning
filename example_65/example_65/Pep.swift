//
//  Pep.swift
//  example_65
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class Pep: UIViewController {
    let boy:String
    @IBOutlet var name : UILabel!
    @IBOutlet var pic : UIImageView!
    
    init(pepBoy boy:String) {
        self.boy = boy
        super.init(nibName:"Pep",bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = self.boy
        self.pic.image = UIImage(named: "\(self.boy.lowercaseString).jpg")
    }
    
    override var description: String{
        return self.boy
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tap(sender:UIGestureRecognizer?){
        NSNotificationCenter.defaultCenter().postNotificationName("tap", object: sender)
    }

}
