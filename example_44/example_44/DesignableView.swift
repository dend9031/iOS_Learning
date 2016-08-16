//
//  DesignableView.swift
//  example_44
//
//  Created by Artem Cherkasov on 8/16/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView:UIView{
    @IBInspectable var name:String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure(){
        self.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView()
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView()
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        
        v2.translatesAutoresizingMaskIntoConstraints = false
        v2.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(v2)
        self.addSubview(v3)
        
        NSLayoutConstraint.activateConstraints([
            v2.leftAnchor.constraintEqualToAnchor(self.leftAnchor),
            v2.rightAnchor.constraintEqualToAnchor(self.rightAnchor),
            v2.topAnchor.constraintEqualToAnchor(self.topAnchor),
            v2.heightAnchor.constraintEqualToConstant(10),
            v3.widthAnchor.constraintEqualToConstant(20),
            v3.heightAnchor.constraintEqualToAnchor(v3.widthAnchor),
            v3.rightAnchor.constraintEqualToAnchor(self.rightAnchor),
            v3.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor)
            ])
    }
    
    override func prepareForInterfaceBuilder() {
        self.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let lab = UILabel()
        lab.text = self.name
        lab.sizeToFit()
        self.addSubview(lab)
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        self.configure()
    }
}
