
import UIKit

class BoundedLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 3.0
    }
    
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(rect.insetBy(dx: 5, dy: 5).integral)
    }
}
