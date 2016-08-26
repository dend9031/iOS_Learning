import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let layer = CAReplicatorLayer()
        layer.frame = CGRectMake(0,0,100,20)
        let bar = CALayer()
        bar.frame = CGRectMake(0, 0, 10, 20)
        bar.backgroundColor = UIColor.redColor().CGColor
        layer.addSublayer(bar)
        layer.instanceCount = 5
        layer.instanceTransform = CATransform3DMakeTranslation(20,0,0)
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.2
        animation.duration = 1
        animation.repeatCount = Float.infinity
        bar.addAnimation(animation, forKey: nil)
        layer.instanceDelay = animation.duration/Double(layer.instanceCount)
        self.view.layer.addSublayer(layer)
        layer.position = CGPointMake(self.view.layer.bounds.midX, self.view.layer.bounds.midY)
    }
}

