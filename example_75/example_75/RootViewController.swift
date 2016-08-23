//
//  RootViewController.swift
//  example_75
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.registerClass(CustomCell.self, forCellReuseIdentifier: "Cell")
//        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)
//        self.tableView.rowHeight = 58
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
//        if cell.textLabel!.numberOfLines != 2{
//            cell.textLabel!.font = UIFont(name:"Helvetica-Bold",size: 16)
//            cell.textLabel!.lineBreakMode = .ByWordWrapping
//            cell.textLabel!.numberOfLines = 2
//        }
//        
//        cell.textLabel!.text = "The author of this book, who would rather be out dirt biking"
//        
//        let im = UIImage(named: "moi.png")!
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(36, 36), true, 0.0)
//        im.drawInRect(CGRectMake(0, 0, 36, 36))
//        let im2 = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        cell.imageView!.image = im2
//        cell.imageView!.contentMode = .Center
//        return cell
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if cell.viewWithTag(1) == nil{
            let iv = UIImageView()
            iv.tag = 1
            cell.contentView.addSubview(iv)
            let label = UILabel()
            label.tag = 2
            cell.contentView.addSubview(label)
            let d = ["iv":iv, "lab":label]
            iv.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            var constraints = [NSLayoutConstraint]()
            constraints.append(iv.widthAnchor.constraintEqualToAnchor(iv.heightAnchor))
                constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[lab]|", options: [], metrics: nil, views: d))
            constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[lab]-15-[iv]-15-|", options:[], metrics: nil, views: d))
            NSLayoutConstraint.activateConstraints(constraints)
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
