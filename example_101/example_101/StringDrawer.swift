import UIKit

class StringDrawer: UIView {
    @NSCopying var attrText:NSAttributedString!{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        let rect = rect.offsetBy(dx: 0, dy: 2)
        let options: NSStringDrawingOptions = [.TruncatesLastVisibleLine, .UsesLineFragmentOrigin]
        
        let drawingContext = NSStringDrawingContext()
        drawingContext.minimumScaleFactor = 0.5
        
        self.attrText.drawWithRect(rect,options:options,context:drawingContext)
        print(drawingContext.totalBounds)
    }
}
