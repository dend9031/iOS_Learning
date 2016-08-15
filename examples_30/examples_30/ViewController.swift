//
//  ViewController.swift
//  examples_30
//
//  Created by Artem Cherkasov on 8/15/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class NewGameController: UIViewController {
    
}

extension NewGameController:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowInComponent:Int) -> Int {
        return 9
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row+1) Stage" + (row > 0 ? "s":"")
    }
}

