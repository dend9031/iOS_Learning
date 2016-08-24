import UIKit

extension Array{
    mutating func removeAtIndexes (indexes:[Int]) -> (){
        for i in indexes.sort(>){
            self.removeAtIndex(i)
        }
    }
}


class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    var sectionNames = [String]()
    var sectionData = [[String]]()
    
    lazy var modelCell:CustomCell = {
        () -> CustomCell in
        let arr = UINib(nibName: "CustomCell",bundle: nil).instantiateWithOwner(nil, options: nil)
        return arr[0] as! CustomCell
    }()
    
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
        
        let b = UIBarButtonItem(title: "Switch", style: .Plain, target: self, action: #selector(doSwitch(_:)))
        self.navigationItem.leftBarButtonItem = b
        
        let b2 = UIBarButtonItem(title: "Delete", style: .Plain, target: self, action: #selector(doDelete(_:)))
        self.navigationItem.rightBarButtonItem = b2
        
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        self.collectionView!.allowsMultipleSelection = true
        
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        self.collectionView!.allowsMultipleSelection = true
        
        self.collectionView!.registerNib(UINib(nibName:"CustomCell",bundle:nil), forCellWithReuseIdentifier: "Cell")
        self.collectionView!.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,withReuseIdentifier: "Header")
        
        self.navigationItem.title = "States"
        
        let flow = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        self.setUpFlowLayout(flow)
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.sectionNames.count
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sectionData[section].count
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var view : UICollectionReusableView! = nil
        if kind == UICollectionElementKindSectionHeader{
            view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", forIndexPath: indexPath)
            if view.subviews.count == 0{
                let label = UILabel()
                view.addSubview(label)
                label.textAlignment = .Center
                label.font = UIFont(name: "Georgia-Bold", size: 22)
                label.backgroundColor = UIColor.lightGrayColor()
                label.layer.cornerRadius = 8
                label.layer.borderWidth = 2
                label.layer.masksToBounds = true
                label.layer.borderColor = UIColor.blackColor().CGColor
                label.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activateConstraints([
                    NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[lab(35)]", options: [], metrics: nil, views: ["lab":label]),
                    NSLayoutConstraint.constraintsWithVisualFormat("V:[lab(30]-5-|", options: [], metrics: nil, views: ["lab":label])
                ].flatten().map{$0})
            }
            let label = view.subviews[0] as! UILabel
            label.text = self.sectionNames[indexPath.section]
        }
        
        return view
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
        if cell.label.text == "Label"{
            cell.layer.cornerRadius = 8
            cell.layer.borderWidth = 2
            
            cell.backgroundColor = UIColor.grayColor()
            
            UIGraphicsBeginImageContextWithOptions(cell.bounds.size, false, 0)
            let con = UIGraphicsGetCurrentContext()!
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.darkGrayColor()
            shadow.shadowOffset = CGSizeMake(2, 2)
            shadow.shadowBlurRadius = 4
            let check2 = NSAttributedString(string: "\u{2714}", attributes:[
                NSFontAttributeName: UIFont(name: "ZapfDingbatsITC", size: 24)!,
                NSForegroundColorAttributeName: UIColor.greenColor(),
                NSStrokeColorAttributeName: UIColor.redColor(),
                NSStrokeWidthAttributeName: -4,
                NSShadowAttributeName: shadow
            ])
            CGContextScaleCTM(con, 1.1, 1)
            check2.drawAtPoint(CGPointMake(2, 0))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let imageView = UIImageView(image: nil,highlightedImage: image)
            imageView.userInteractionEnabled = false
            cell.addSubview(imageView)
        }
        let image = UIImage(named: "us_flag_small.gif")
        let imageView = UIImageView(image:image)
        imageView.contentMode = .ScaleAspectFit
        cell.backgroundView = imageView
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        self.modelCell.label.text = self.sectionData[indexPath.section][indexPath.row]
        var size = self.modelCell.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        size.width = ceil(size.width); size.height = ceil(size.height)
        return size
    }
    
    func doSwitch(sender:AnyObject!){
        let oldLayout = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        var newLayout = self.collectionViewLayout as! UICollectionViewFlowLayout
        if newLayout == oldLayout{
            newLayout = CustomFlowLayout()
        }
        self.setUpFlowLayout(newLayout)
        self.collectionView!.setCollectionViewLayout(newLayout, animated: true)
    }
    
    func doDelete(sender:AnyObject){
        let arr = self.collectionView!.indexPathsForSelectedItems()!
        if arr.count == 0{
            return
        }
        
        let arr2 = ((arr as NSArray).sortedArrayUsingSelector(#selector(NSIndexPath.compare(_:))) as! [NSIndexPath])
        var empties = [Int]()
        for indexPath in arr2.reverse(){
            self.sectionData[indexPath.section].removeAtIndex(indexPath.item)
            if self.sectionData[indexPath.section].count == 0 {
                empties += [indexPath.section]
            }
        }
        
        let emptySet = NSMutableIndexSet()
        for i in empties {
            emptySet.addIndex(i)
        }
        
        self.collectionView!.performBatchUpdates({
                self.collectionView!.deleteItemsAtIndexPaths(arr2)
            if empties.count > 0{
                self.sectionNames.removeAtIndexes(empties)
                self.sectionData.removeAtIndexes(empties)
                self.collectionView!.deleteSections(emptySet)
            }
            }, completion: nil)
    }
    
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        let menuItem = UIMenuItem(title:"Capital", action:#selector(CustomCell.capital))
        UIMenuController.sharedMenuController().menuItems = [menuItem]
        return true
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return (action == #selector(copy(_:)))||(action == #selector(CustomCell.capital))
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        let state = self.sectionData[indexPath.section][indexPath.row]
        if action == #selector(copy(_:)){
            print("copying \(state)")
        }else if action == #selector(CustomCell.capital){
            print("fetching the capital of state \(state)")
        }
    }
    
    func setUpFlowLayout(flow:UICollectionViewFlowLayout){
        flow.headerReferenceSize = CGSizeMake(50, 50)
        flow.sectionInset = UIEdgeInsetsMake(0,10, 10, 10)
    }

}

