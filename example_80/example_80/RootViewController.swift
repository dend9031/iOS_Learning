import UIKit

class RootViewController: UITableViewController, UITextFieldDelegate {
    var numbers = [String]()
    var name = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.name = "Matt Neuberg"
        self.numbers = ["(123) 456-7890"]
        self.tableView.allowsSelection = false
        self.tableView.registerNib(UINib(nibName:"CustomTableViewCell",bundle: nil), forCellReuseIdentifier: "Cell")
   }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return self.numbers.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath) as! CustomTableViewCell
        switch indexPath.section{
        case 0:
            cell.textField.text = self.name
        case 1:
            cell.textField.text = self.numbers[indexPath.row]
            cell.textField.keyboardType = .NumbersAndPunctuation
        default: break
        }
        cell.textField.delegate = self
        return cell
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if indexPath.section == 1{
            let ct = self.tableView(tableView, numberOfRowsInSection: indexPath.section)
            if ct - 1 == indexPath.row{
                return .Insert
            }
            return .Delete
        }
        return .None
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        if section == 0 {
            return "Name"
        }
        return "Number"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        var v: UIView = textField
        repeat {v = v.superview!} while !(v is UITableViewCell)
            let  cell = v as! CustomTableViewCell
            let indexPath = self.tableView.indexPathForCell(cell)!
        if indexPath.section == 1{
            self.numbers[indexPath.row] = cell.textField.text!
        }else if indexPath.section == 0{
            self.name = cell.textField.text!
        }
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 1{
            return true
        }
        return false
    }
    
    override func tableView(tableView: UITableView,moveRowAtIndexPath fromIndexPath:NSIndexPath,toIndexPath:NSIndexPath) {
        let s = self.numbers[fromIndexPath.row]
        self.numbers.removeAtIndex(fromIndexPath.row)
        self.numbers.insert(s, atIndex: toIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        tableView.endEditing(true)
        if proposedDestinationIndexPath.section == 0{
            return NSIndexPath(forRow: 0, inSection: 1)
        }
        return proposedDestinationIndexPath
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 1 && self.numbers.count > 1{
            return true
        }
        return false
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Insert{
            self.numbers += [""]
            let count = self.numbers.count
            tableView.beginUpdates()
            tableView.insertRowsAtIndexPaths([NSIndexPath(forRow:count-1, inSection:1)], withRowAnimation: .Automatic)
            tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow:count-2, inSection:1)], withRowAnimation: .Automatic)
            tableView.endUpdates()
            let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: count - 1, inSection: 1))
            (cell as! CustomTableViewCell).textField.becomeFirstResponder()
        }
        if editingStyle == .Delete{
            self.numbers.removeAtIndex(indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            tableView.reloadSections(NSIndexSet(index:1), withRowAnimation: .Automatic)
            tableView.endUpdates()
        }
    }
}
