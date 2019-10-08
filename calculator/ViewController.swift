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
    @IBOutlet weak var salesTaxLabel: UILabel!
    var numOfPeople = 1
    var tax = 0.06
    var pickOption = ["1", "2", "3", "4", "5", "6", "7", "8", "9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //var pickerView = UIPickerView()
        billField.becomeFirstResponder()
        pickerView.delegate = self
        tipLabel.text = String(format: "$%.2f", 0)
        totalLabel.text = String(format: "$%.2f", 0)
        tipSlider.value = 0.15
        salesTaxLabel.text = String(format: "%.0f", 100 * tax)
        tipPercentageLabel.text = String(format: "%.1f", 100 * tipSlider.value)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults()
        billField.becomeFirstResponder()
        pickerView.delegate = self
        tipSlider.value = defaults.float(forKey: "tip")
        tax = Double(defaults.float(forKey: "tip"))
        salesTaxLabel.text = String(format: "%.0f", 100 * defaults.float(forKey: "tax"))
        tipPercentageLabel.text = String(format: "%.1f %", tipSlider.value * 100)
        defaults.synchronize()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill now
        let bill = Double(billField.text!) ?? 0
        let defaults = UserDefaults()
        let defaultTax = defaults.float(forKey: "tax")
        tax = Double(defaultTax)
        // Calculate tip & total
        let tip = bill * Double(tipSlider.value)
        let total = tip + bill * (1+tax)
        
        // update corresponding labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        tipPercentageLabel.text = String(format: "%.1f %", tipSlider.value * 100)
        defaults.synchronize()
        self.pickerView(pickerView, didSelectRow: numOfPeople - 1, inComponent: 1)    }
    
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
        let total = tip + bill * (1+tax)
        numOfPeople = Int(pickOption[row]) ?? 1
        
        let perPersonCost = total / Double(numOfPeople)
        
        //update label
        if numOfPeople > 1 {
        perPersonCostLabel.text = String(format: "$%.2f per person", perPersonCost)
        }
    }
}

