//
//  ViewController.swift
//  calculator
//
//  Created by William Gao on 10/5/19.
//  Copyright © 2019 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var perPersonCostLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickOption = ["1", "2", "3", "4", "5", "6", "7", "8", "9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //var pickerView = UIPickerView()
        
           pickerView.delegate = self
        
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill now
        let bill = Double(billField.text!) ?? 0
        
        
        // Calculate tip & total
        let tip = bill * Double(tipSlider.value)
        let total = tip + bill
        
        // update corresponding labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        tipPercentageLabel.text = String(format: "%.1f", tipSlider.value * 100)
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
       }
       
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //calculate per person cost
        
        let bill = Double(billField.text!) ?? 0
        
        // Calculate tip & total
        let tip = bill * Double(tipSlider.value)
        let total = tip + bill
        
        let numberOfPeople = Int(pickOption[row]) ?? 1
        
        let perPersonCost = total / Double(numberOfPeople)
        
        //update label
        perPersonCostLabel.text = String(format: "$%.2f per person", perPersonCost)
    }
}

