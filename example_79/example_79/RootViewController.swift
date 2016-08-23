import UIKit

class RootViewController: UITableViewController {
    
    var sectionNames = [String]()
    var sectionData = [[String]]()
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
        
    override func viewDidLoad() {
        let s = try! String(contentsOfFile: NSBundle.mainBundle().pathForResource("states", ofType: "txt")!,
                            encoding: NSUTF8StringEncoding)
        let states = s.componentsSeparatedByString("\n")
        var previous = ""
        for state in states{
            let c = String(state.characters.prefix(1))
            if c != previous{
                previous = c
                self.sectionNames.append(c.uppercaseString)
                self.sectionData.append([String]())
            }
            sectionData[sectionData.count - 1].append(state)
        }
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.registerClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
        
        self.tableView.sectionIndexColor = UIColor.whiteColor()
        self.tableView.sectionIndexBackgroundColor = UIColor.redColor()
        self.tableView.backgroundColor = UIColor.yellowColor()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sectionNames.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectionData[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath)
        let s = self.sectionData[indexPath.section][indexPath.row]
        cell.textLabel!.text = s
        cell.imageView!.image = UIImage(named:"us_flag_small.gif")
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let h = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header")!
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
            let imageView = UIImageView()
            imageView.tag = 2
            imageView.backgroundColor = UIColor.blackColor()
            imageView.image = UIImage(named: "us_flag_small.gif")
            h.contentView.addSubview(imageView)
            label.translatesAutoresizingMaskIntoConstraints = false
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activateConstraints([
                NSLayoutConstraint.constraintsWithVisualFormat("H:|-5-[lab(25)]-10-[v(40)]", options: [], metrics: nil, views:["v":imageView,"lab":label]),
                NSLayoutConstraint.constraintsWithVisualFormat("V:|[v]|", options: [], metrics: nil, views:["v":imageView]),
                NSLayoutConstraint.constraintsWithVisualFormat("V:|[lab]|", options: [], metrics: nil, views: ["lab":label])
                ].flatten().map{$0})
        }
        let lab = h.contentView.viewWithTag(1) as! UILabel
        lab.text = self.sectionNames[section]
        return h
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .Normal, title:"Mark"){
            action, indexPath in
            print("Mark")
        }
        action.backgroundColor = UIColor.blueColor()
        let action2 = UITableViewRowAction(style:.Default, title: "Delete"){
            action,indexPath in
            self.tableView(self.tableView,commitEditingStyle:.Delete,forRowAtIndexPath: indexPath)
        }
        return [action,action2]
    }
    

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        self.sectionData[indexPath.section].removeAtIndex(indexPath.row)
        if self.sectionData[indexPath.section].count == 0 {
            self.sectionData.removeAtIndex(indexPath.section)
            self.sectionNames.removeAtIndex(indexPath.section)
            tableView.deleteSections(NSIndexSet(index:indexPath.section), withRowAnimation: .Automatic)
            tableView.reloadSectionIndexTitles()
        }else{
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return self.editing ? .Delete : .None
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return self.sectionNames
    }
}
