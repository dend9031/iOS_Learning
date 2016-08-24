import UIKit

class ViewController: UICollectionViewController {
    var sectionNames = [String]()
    var sectionData = [[String]]()
    
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
        self.navigationItem.title = "States"
        self.collectionView!.registerClass(UICollectionReusableView.self,forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        let flow = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        flow.headerReferenceSize = CGSizeMake(30, 30)
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.sectionNames.count
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sectionData[section].count
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var v: UICollectionReusableView! = nil
        if kind == UICollectionElementKindSectionHeader{
            v = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", forIndexPath: indexPath)
            if v.subviews.count == 0 {
                v.addSubview(UILabel(frame: CGRectMake(0,0,30,30)))
            }
            let label = v.subviews[0] as! UILabel
            label.text = (self.sectionNames)[indexPath.section]
            label.textAlignment = .Center
        }
        return v
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        if cell.contentView.subviews.count == 0{
            cell.contentView.addSubview(UILabel(frame: CGRectMake(0,0,30,30)))
        }
        let label = cell.contentView.subviews[0] as! UILabel
        label.text = (self.sectionData)[indexPath.section][indexPath.item]
        label.sizeToFit()
        return cell
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let label = UILabel(frame: CGRectMake(0,0,30,30))
        label.text = (self.sectionData)[indexPath.section][indexPath.item]
        label.sizeToFit()
        return label.bounds.size
    }
}

