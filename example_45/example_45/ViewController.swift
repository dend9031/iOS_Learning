//
//  ViewController.swift
//  example_45
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iv:UIImageView!
    @IBOutlet weak var iv2:UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.iv.image = UIImage(named: "Moods")
        let tcdisp = UITraitCollection(displayScale: UIScreen.mainScreen().scale)
        let tcphone = UITraitCollection(userInterfaceIdiom: .Phone)
        let tcreg = UITraitCollection(verticalSizeClass: .Regular)
        let tc1 = UITraitCollection(traitsFromCollections:[tcdisp,tcphone,tcreg])
        let tccom = UITraitCollection(verticalSizeClass: .Compact)
        let tc2 = UITraitCollection(traitsFromCollections: [tcdisp,tcphone,tccom])
        let moods = UIImageAsset()
        let frowney = UIImage(named: "frowney")!.imageWithRenderingMode(.AlwaysOriginal)
        let smiley = UIImage(named: "smiley")!.imageWithRenderingMode(.AlwaysOriginal)
        moods.registerImage(frowney, withTraitCollection: tc1)
        moods.registerImage(smiley, withTraitCollection: tc2)
        
        let tc = self.traitCollection
        let im = moods.imageWithTraitCollection(tc)
        self.iv2.image = im
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

