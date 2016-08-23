import UIKit

class ViewController: UICollectionViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(150, 50)
        let v = UIView()
        v.backgroundColor = UIColor.orangeColor()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        if cell.backgroundView == nil{
            cell.backgroundColor = UIColor.redColor()
            
            let v = UIImageView(frame: cell.bounds)
            v.contentMode = .ScaleToFill
            v.image = UIImage(named:"linen.png")
            cell.backgroundView = v
            
            let v2 = UIView(frame: cell.bounds)
            v2.backgroundColor = UIColor(white: 0.2, alpha: 0.1)
            cell.selectedBackgroundView = v2
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.tag = 1
            NSLayoutConstraint.activateConstraints([
                label.centerXAnchor.constraintEqualToAnchor(cell.contentView.centerXAnchor),
                label.centerYAnchor.constraintEqualToAnchor(cell.contentView.centerYAnchor)
            ])
            label.textColor = UIColor.blackColor()
            label.highlightedTextColor = UIColor.whiteColor()
            label.backgroundColor = UIColor.clearColor()
        }
        let label = cell.viewWithTag(1) as! UILabel
        label.text  = "Howdy there \(indexPath.item)"
        return cell
    }
}

