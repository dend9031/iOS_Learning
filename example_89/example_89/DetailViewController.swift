//
//  DetailViewController.swift
//  example_89
//
//  Created by Artem Cherkasov on 8/24/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailDescriptionLabel: UILabel!
    var detailItem:AnyObject?{
        didSet{
            self.configureView()
        }
    }
    
    func configureView(){
        if let detail:AnyObject = self.detailItem{
            if let label = self.detailDescriptionLabel{
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

}
