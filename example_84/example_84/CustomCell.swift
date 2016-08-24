//
//  CustomCell.swift
//  example_84
//
//  Created by Artem Cherkasov on 8/24/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var container: UIView!
    
    func capital(sender:AnyObject!){
        var view:UIView = self
        repeat {view = view.superview!} while !(view is UICollectionView)
        let collectionView = view as! UICollectionView
        let indexPath = collectionView.indexPathForCell(self)!
        collectionView.delegate?.collectionView?(collectionView, performAction:#selector(capital),forItemAtIndexPath:indexPath,withSender:sender)
    }
}
