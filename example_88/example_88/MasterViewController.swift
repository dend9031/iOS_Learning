//
//  MasterViewController.swift
//  example_88
//
//  Created by Artem Cherkasov on 8/24/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    let names = ["Manny","Moe","Jack"]
    var didInitialSetup = false
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath)
        cell.textLabel!.text = names[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = DetailedViewController()
        detailViewController.boy = names[indexPath.row]
        let b = self.splitViewController!.displayModeButtonItem()
        detailViewController.navigationItem.leftBarButtonItem = b
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        let navigationViewController = UINavigationController(rootViewController: detailViewController)
        self.showDetailViewController(navigationViewController, sender: self)
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        delegate.didChooseDetail = true
    }
    
//    override func viewWillLayoutSubviews() {
//        if !self.didInitialSetup{
//            self.didInitialSetup = true
//            let splitViewController = self.childViewControllers[0] as! UISplitViewController
//            splitViewController.preferredDisplayMode = .AllVisible
//            splitViewController.preferredPrimaryColumnWidthFraction = 0.5
//            splitViewController.maximumPrimaryColumnWidth = 500
//            let traits = UITraitCollection(traitsFromCollections:[UITraitCollection(horizontalSizeClass: .Regular)])
//            self.setOverrideTraitCollection(traits, forChildViewController: splitViewController)
//        }
//    }
}
