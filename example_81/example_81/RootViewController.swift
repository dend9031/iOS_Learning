import UIKit

func delay(delay:Double, closure:()->()){
    dispatch_after(
    dispatch_time(
        DISPATCH_TIME_NOW,
        Int64(delay * Double(NSEC_PER_SEC))
    ),
    dispatch_get_main_queue(),closure)
}

class CustomHeaderView:UITableViewHeaderFooterView{
    var section = 0
    deinit{
        print("farewell from header, section \(section)")
    }
}

class RootViewController: UITableViewController {
    var sectionNames = [String]()
    var sectionData = [[String]]()
//    var hiddenSections = Set<Int>()
    
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
        
        self.tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.registerClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
        
        self.tableView.sectionIndexColor = UIColor.whiteColor()
        self.tableView.sectionIndexBackgroundColor = UIColor.redColor()
        self.tableView.backgroundColor = UIColor.yellowColor()
        
        delay(5){
            self.tableView.reloadData()
        }

   }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sectionNames.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.hiddenSections.contains(section){
//            return 0
//        }
        return self.sectionData[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath)
        let s = self.sectionData[indexPath.section][indexPath.row]
        cell.textLabel!.text = s
        cell.imageView!.image = UIImage(named: "us_flag_small.gif")
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
//            let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
//            tap.numberOfTapsRequired = 2
//            h.addGestureRecognizer(tap)
        }
        let lab = h.contentView.viewWithTag(1) as! UILabel
        lab.text = self.sectionNames[section]
//        h.section = section
        return h
    }
//
//    func tapped(g:UIGestureRecognizer){
//        let view = g.view as! CustomHeaderView
//        let section = view.section
//        let count = self.sectionData[section].count
//        let arr = (0..<count).map{NSIndexPath(forRow: $0, inSection: section)}
//        if self.hiddenSections.contains(section){
//            self.hiddenSections.remove(section)
//            self.tableView.beginUpdates()
//            self.tableView.insertRowsAtIndexPaths(arr, withRowAnimation: .Automatic)
//            self.tableView.endUpdates()
//            self.tableView.scrollToRowAtIndexPath(arr[count - 1], atScrollPosition: .None, animated: true)
//        }else{
//            self.hiddenSections.insert(section)
//            self.tableView.beginUpdates()
//            self.tableView.deleteRowsAtIndexPaths(arr, withRowAnimation: .Automatic)
//            self.tableView.endUpdates()
//        }
//    }

override func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    let mi = UIMenuItem(title: "Abbrev", action:#selector(CustomTableViewCell.abbrev))
    UIMenuController.sharedMenuController().menuItems = [mi]
    return true
}

override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
    return action == #selector(copy(_:)) || action == #selector(CustomTableViewCell.abbrev)
}

override func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    if action == #selector(copy(_:)){
        print("copying \(self.sectionData[indexPath.section][indexPath.row])")
    }
    if action == #selector(CustomTableViewCell.abbrev){
        print("abbrevating \(self.sectionData[indexPath.section][indexPath.row])")
    }
}
    
}
