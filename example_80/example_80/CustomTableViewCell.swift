//
//  CustomTableViewCell.swift
//  example_80
//
//  Created by Artem Cherkasov on 8/23/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    
    override func didTransitionToState(state: UITableViewCellStateMask) {
        self.textField.enabled = state.contains(.ShowingEditControlMask)
        super.didTransitionToState(state)
    }
}
