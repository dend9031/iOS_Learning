//
//  RootViewController.swift
//  example_78
//
//  Created by Artem Cherkasov on 8/23/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class CustomSearchContoller : UISearchController{
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

class RootViewController: UITableViewController {
    var sectionNames = [String]()
    var sectionData = [[String]]()
    var originalSectionNames = [String]()
    var originalSectionData = [[String]]()
    var searcher: UISearchController!
    var searching = false
    
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
        self.tableView.backgroundView = {
            let v = UIView()
            v.backgroundColor = UIColor.yellowColor()
            return v
        }()
        
        let searcher = CustomSearchContoller(searchResultsController: nil)
        self.searcher = searcher
        self.originalSectionData = self.sectionData
        self.originalSectionNames = self.sectionNames
        searcher.dimsBackgroundDuringPresentation = false
        searcher.delegate = self
        searcher.searchResultsUpdater = self
        let b = searcher.searchBar
        b.sizeToFit()
        b.scopeButtonTitles = ["Starts", "Contains"]
        b.autocapitalizationType = .None
        self.tableView.tableHeaderView = b
        self.tableView.reloadData()
        self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: .Top, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        }
        let lab = h.contentView.viewWithTag(1) as! UILabel
        lab.text = self.sectionNames[section]
        return h
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return self.searching ? nil:self.sectionNames
    }

}

extension RootViewController:UISearchControllerDelegate{
    func willPresentSearchController(searchController: UISearchController) {
        self.searching = true
    }
    
    func willDismissSearchController(searchController: UISearchController) {
        self.searching = false
    }
}

extension RootViewController:UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let sb = searchController.searchBar
        let target = sb.text!
        if target == ""{
            self.sectionNames = self.originalSectionNames
            self.sectionData = self.originalSectionData
            self.tableView.reloadData()
        }
        
        self.sectionData = self.originalSectionData.map{
            $0.filter{
                let options = NSStringCompareOptions.CaseInsensitiveSearch
                let found = $0.rangeOfString(target,options: options)
                return (found != nil)
            }
            }.filter{$0.count > 0}
        self.sectionNames = self.sectionData.map{
            String($0[0].characters.prefix(1))
        }
        self.tableView.reloadData()
    }
}

//extension RootViewController:UISearchControllerDelegate,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
//    var which:Int{return 1}
//    
//    func presentSearchController(searchController: UISearchController) {
//        let src = searchController.searchResultsController as! SearchResultController
//        src.takeData(self.sectionData)
//        searchController.searchResultsUpdater = src
//        searchController.searchBar.delegate = src
//        
//        switch which{
//        case 0: break
//        case 1:
//            searchController.transitioningDelegate = self
//            searchController.modalPresentationStyle = .Custom
//        default: break
//        }
//        self.presentViewController(searchController, animated: true, completion: nil)
//    }
//    
//    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
//        let p = UIPresentationController(presentedViewController: presented, presentingViewController: presenting)
//        return p
//    }
//    
//    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return self
//    }
//    
//    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return self
//    }
//    
//    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
//        return 0.3
//    }
//    
//    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//        let vc1 = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
//        let vc2 = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
//        
//        let containerView = transitionContext.containerView()!
//        
//        let r2end = transitionContext.finalFrameForViewController(vc2)
//        let v2 = transitionContext.viewForKey(UITransitionContextToViewKey)
//        
//        if let v2 = v2{
//            containerView.addSubview(v2)
//            v2.frame = r2end
//            let sc = vc2 as! UISearchController
//            let sb = sc.searchBar
//            sb.removeFromSuperview()
//            sb.showsScopeBar = true
//            sb.sizeToFit()
//            v2.addSubview(sb)
//            sb.frame.origin.y = -sb.frame.height
//            UIView.animateWithDuration(0.3, animations:{
//                sb.frame.origin.y = 0
//                },completion:{
//                    _ in
//                    sb.setShowsCancelButton(true, animated: true)
//                    transitionContext.completeTransition(true)
//            })
//        }else{
//            let sc = vc1 as! UISearchController
//            let sb = sc.searchBar
//            sb.showsCancelButton = false
//            sb.showsScopeBar = false
//            sb.sizeToFit()
//            
//            UIView.animateWithDuration(0.3, animations: {
//                }, completion: {
//                    _ in
//                    transitionContext.completeTransition(true)
//            })
//        }
//    }
//}
