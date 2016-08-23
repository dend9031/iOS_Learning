//
//  CustomTableViewCell.swift
//  example_81
//
//  Created by Artem Cherkasov on 8/23/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    func abbrev(sender:AnyObject!){
        var v:UIView = self
        repeat {v = v.superview!} while !(v is UITableView)
        let tv = v as! UITableView
        let ip = tv.indexPathForCell(self)!
        tv.delegate?.tableView?(tv, performAction: #selector(abbrev),forRowAtIndexPath:ip,withSender:sender)
    }
}
