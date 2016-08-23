//
//  RootViewController.swift
//  example_77
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    var sectionsNames = [String]()
    var sectionData = [[String]]()
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let s = try! String(contentsOfFile: NSBundle.mainBundle().pathForResource("states", ofType: "txt")!, encoding:NSUTF8StringEncoding)
        let states = s.componentsSeparatedByString("\n")
        var previous = ""
        
        for aState in states{
            let c = String(aState.characters.prefix(1))
            
            if c != previous {
                previous = c
                self.sectionsNames.append(c.uppercaseString)
                self.sectionData.append([String]())
            }
            sectionData[sectionData.count-1].append(aState)
        }
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.registerClass(UITableViewHeaderFooterView.self, forCellReuseIdentifier: "Header")
      
        self.tableView.sectionIndexColor = UIColor.whiteColor()
        self.tableView.sectionIndexBackgroundColor = UIColor.redColor()
        self.tableView.sectionIndexTrackingBackgroundColor = UIColor.blueColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sectionsNames.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectionData[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath)
        let s = self.sectionData[indexPath.section][indexPath.row]
        cell.textLabel!.text = s
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let h = tableView.dequeueReusableCellWithIdentifier("Header")!
        if h.tintColor != UIColor.redColor(){
            h.tintColor = UIColor.redColor()
            h.backgroundView = UIView()
            h.backgroundView?.backgroundColor = UIColor.blackColor()
            let label = UILabel()
            label.tag = 1
            label.font = UIFont(name: "Georgia-Bold", size: 22)
            label.textColor = UIColor.greenColor()
            label.backgroundColor = UIColor.clearColor()
            h.contentView.addSubview(label)
        }
        let label = h.contentView.viewWithTag(1) as! UILabel
        label.text = self.sectionsNames[section]
        return h
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return self.sectionsNames
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
