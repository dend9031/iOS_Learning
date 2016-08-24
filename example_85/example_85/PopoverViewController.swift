import UIKit

class PopoverViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSizeMake(320, 320)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result = 0
        switch section{
        case 0:
            result = 2
        case 1:
            result = 1
        default: break
        }
        return result
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath)
        
        let section = indexPath.section
        let row = indexPath.row
        let choice = NSUserDefaults.standardUserDefaults().integerForKey("choice")
        switch  section {
        case 0:
            switch  row {
            case 0:
                 cell.textLabel!.text = "First"
            case 1:
                cell.textLabel!.text = "Second"
            default:
                break
            }
            cell.accessoryType = (choice == row ?
                .Checkmark:
                .None)
        case 1:
            cell.textLabel!.text = "Change size"
            cell.accessoryType = .DisclosureIndicator
        default:
            break
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        switch section {
        case 0:
            NSUserDefaults.standardUserDefaults().setInteger(row, forKey: "choice")
        case 1:
            let nextView = Popover1View2()
            self.showViewController(nextView, sender: self)
        default:
            break
        }
    }
    
    class Popover1View2:UIViewController{
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.redColor()
            self.preferredContentSize = CGSizeMake(400, 400)
        }
    }
}
