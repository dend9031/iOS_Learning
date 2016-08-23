import UIKit
import Swift


class SearchResultController: UITableViewController {
    var origingalData:[String]
    var filteredData = [String]()
    weak var searchController:UISearchController?
    
    init(data:[[String]]){
        self.origingalData = data.flatten().map{$0}
        super.init(nibName:nil, bundle: nil)
    }
    
    func takeData(data:[[String]]){
        self.origingalData = data.flatten().map{$0}
    }
    
    required init(coder:NSCoder){
        fatalError("NSCoding not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel!.text = self.filteredData[indexPath.row]
        return cell
    }
    
}

extension SearchResultController:UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.searchController = searchController
        let sb = searchController.searchBar
        let target = sb.text!
        self.filteredData = self.origingalData.filter{
            s in
            var options = NSStringCompareOptions.CaseInsensitiveSearch
            if searchController.searchBar.selectedScopeButtonIndex == 0{
                options.insert(.AnchoredSearch)
            }
            let found = s.rangeOfString(target,options: options)
            return (found != nil)
        }
        self.tableView.reloadData()
    }
}

extension SearchResultController:UISearchBarDelegate{
    func searchBar(searchBer:UISearchBar, selectedScopeButtonIndexDidChange selectedScope:Int){
        self.updateSearchResultsForSearchController(self.searchController!)
    }
}
