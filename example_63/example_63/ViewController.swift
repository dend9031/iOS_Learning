//
//  ViewController.swift
//  example_63
//
//  Created by Artem Cherkasov on 8/19/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func unwind(seg:UIStoryboardSegue!){
        
    }
}

class ViewController2 : UIViewController{
    @IBAction func doDissmiss(sender:AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}



class CustomSegue:UIStoryboardSegue {
    override func perform() {
        let dest = self.destinationViewController
        dest.modalPresentationStyle = .Custom
        dest.transitioningDelegate = self
        super.perform()
    }
}

extension CustomSegue:UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

extension CustomSegue:UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.8
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let vc1 = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let vc2 = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        let container = transitionContext.containerView()!
        
        let r1start = transitionContext.initialFrameForViewController(vc1)
        let r2end = transitionContext.finalFrameForViewController(vc2)
        
        if let v2 = transitionContext.viewForKey(UITransitionContextToViewKey){
            var r2start = r2end
            r2start.origin.y -= r2start.size.height
            v2.frame = r2start
            container.addSubview(v2)
            UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [],
                                       animations: {
                                        v2.frame = r2end
                }, completion: {
                    _ in
                    transitionContext.completeTransition(true)
            })
        }else if let v1 = transitionContext.viewForKey(UITransitionContextFromViewKey){
            var r1end = r1start
            r1end.origin.y = -r1end.size.height
            UIView.animateWithDuration(0.8, animations:{
                v1.frame = r1end
                }, completion: {
                    _ in
                    transitionContext.completeTransition(true)
            })
        }
    }
}

