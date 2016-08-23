//
//  ViewController.swift
//  ReusableCellExample
//
//  Created by Artem Cherkasov on 8/23/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let names = ["Peter", "John","Alex", "Michael"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.registerClass(TableViewCell.self,forCellReuseIdentifier: "TableViewCell")
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell
        cell.nameLabel!.text = names[indexPath.row]
        cell.pic!.image = UIImage(named: "moi.png")
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

   
}

