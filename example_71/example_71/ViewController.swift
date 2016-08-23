//
//  ViewController.swift
//  example_71
//
//  Created by Artem Cherkasov on 8/22/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var sv:UIScrollView!
    @IBOutlet var iv:UIImageView!
    var didSetup = false
    var oldBounces = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        if !self.didSetup{
            self.didSetup = true
            self.sv.contentSize = CGSizeMake(400, 300)
            let pt = CGPointMake((self.iv.bounds.width - self.sv.bounds.width)/2.0, 0)
            self.sv.setContentOffset(pt, animated: false)
        }
    }

    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
        self.oldBounces = scrollView.bounces
        scrollView.bounces = false
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        scrollView.bounces = self.oldBounces
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return scrollView.viewWithTag(999)
    }
    
    let anim = true
    @IBAction func tapped(tap:UIGestureRecognizer){
        let v = tap.view!
        let sv = v.superview as! UIScrollView
        if sv.zoomScale < 1 {
            sv.setZoomScale(1, animated: true)
            let pt = CGPointMake((v.bounds.width - sv.bounds.width)/2.0, 0)
            sv.setContentOffset(pt, animated: true)
        }else if sv.zoomScale < sv.maximumZoomScale{
            sv.setZoomScale(sv.maximumZoomScale, animated: true)
        }else{
            sv.setZoomScale(sv.minimumZoomScale, animated: true)
        }
    }
}

class ZoomedScrollView : UIScrollView{
    override func layoutSubviews() {
        super.layoutSubviews()
        if let v = self.delegate?.viewForZoomingInScrollView?(self){
            let svw = self.bounds.width
            let svh = self.bounds.height
            let vw = v.frame.width
            let vh = v.frame.height
            var f = v.frame
            if vw < svw{
                f.origin.x = (svw - vw) / 2.0
            }else {
                f.origin.x = 0
            }
            if vh < svh{
                f.origin.y = (svh - vh)/2.0
            }else{
                f.origin.y = 0
            }
            
            v.frame = f
        }
    }
}

