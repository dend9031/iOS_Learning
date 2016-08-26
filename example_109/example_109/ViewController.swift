//
//  ViewController.swift
//  example_109
//
//  Created by Artem Cherkasov on 8/25/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    let items = ["Item1","Item 2 ","Item 3","Item 4","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5","Item 5"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let lab:UILabel
        if let label = view as? UILabel{
            lab = label
        }else{
            lab = UILabel()
        }
        lab.text = self.items[row]
        lab.backgroundColor = UIColor.clearColor()
        lab.sizeToFit()
        return lab
    }
}



