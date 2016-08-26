import UIKit

class ViewController: UIViewController,UITabBarDelegate {
    @IBOutlet var tabbar: UITabBar!
    
    var blue = true
    var dim = false
    
    var items:[UITabBarItem] = {
        Array(1..<8).map{
            UITabBarItem(tabBarSystemItem: UITabBarSystemItem(rawValue:$0)!,tag: $0)
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabbar.items = Array(self.items[0..<4]) + [UITabBarItem(tabBarSystemItem:.More,tag:0)]
        self.tabbar.selectedItem = self.tabbar.items![0]
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if item.tag == 0{
            tabBar.selectedItem = nil
            tabBar.beginCustomizingItems(self.items)
        }
    }
    
    func tabBar(tabBar: UITabBar, didEndCustomizingItems items: [UITabBarItem], changed: Bool) {
        self.tabbar.selectedItem = self.tabbar.items![0]
    }
    
    @IBAction func doToggleTint(sender:AnyObject){
        self.blue = !self.blue
        self.view.tintColor = self.blue ? nil:UIColor.redColor()
    }
    
    @IBAction func doToogleDimming(sender:AnyObject){
        self.dim = !self.dim
        self.view.tintAdjustmentMode = self.dim ? .Dimmed:.Automatic
    }
}

