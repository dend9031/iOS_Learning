//
//  ViewController.swift
//  example_68
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var sv:UIScrollView!
    @IBOutlet weak var pager:UIPageControl!

    var didLayout = false
    
    override func viewDidLayoutSubviews() {
        if !self.didLayout{
            self.didLayout = true
            let size = self.sv.bounds.size
            let colors = [UIColor.redColor(), UIColor.greenColor(), UIColor.yellowColor()]
            for i in 0..<3{
                let v = UIView(frame: CGRectMake(size.width * CGFloat(i),0,size.width,size.height))
                v.backgroundColor = colors[i]
                self.sv.addSubview(v)
            }
            self.sv.contentSize = CGSizeMake(3 * size.width, size.height)
        }
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        print("begin")
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("end")
        let x = self.sv.contentOffset.x
        let w = self.sv.bounds.size.width
        self.pager.currentPage = Int(x/w)
    }
    
    @IBAction func userDidPage(sender:AnyObject?){
        let p = self.pager.currentPage
        let w = self.sv.bounds.size.width
        self.sv.setContentOffset(CGPointMake(CGFloat(p) * w, 0), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

