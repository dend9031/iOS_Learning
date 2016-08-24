//
//  CustomFlowLayout.swift
//  example_84
//
//  Created by Artem Cherkasov on 8/24/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElementsInRect(rect)!
        return attributes.map{
            atts in
            var atts = atts
            if atts.representedElementKind == nil{
                atts = self.layoutAttributesForItemAtIndexPath(atts.indexPath)!
            }
            return atts
        }
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        var attributes = super.layoutAttributesForItemAtIndexPath(indexPath)!
        if indexPath.item == 0{
            return attributes
        }
        if attributes.frame.origin.x - 1 <= self.sectionInset.left{
            return attributes
        }
        
        let ipPv = NSIndexPath(forItem: indexPath.item - 1, inSection: indexPath.section)
        let fPv = self.layoutAttributesForItemAtIndexPath(ipPv)!.frame
        let rightPv = fPv.origin.x + fPv.size.width + self.minimumInteritemSpacing
        attributes = attributes.copy() as! UICollectionViewLayoutAttributes
        attributes.frame.origin.x = rightPv
        return attributes
    }
}
