//
//  Pep.swift
//  example_62
//
//  Created by Artem Cherkasov on 8/19/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class Pep: UIViewController {
    let boyName:String
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var pic:UIImageView!
    
    init(pepBoy boyName:String){
        self.boyName = boyName
        super.init(nibName:"Pep", bundle: nil)
    }
    
    required init(coder:NSCoder){
        fatalError("NSCoding not supported")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = self.boyName
        self.pic.image = UIImage(named:"\(self.boyName.lowercaseString).jpg")
    }
    
    override var description: String{
        return self.boyName
    }

    @IBAction func tap(sender:UIGestureRecognizer?){
        NSNotificationCenter.defaultCenter().postNotificationName("tap", object: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}
