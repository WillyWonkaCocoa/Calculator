//
//  SettingsViewController.swift
//  calculator
//
//  Created by William Gao on 10/7/19.
//  Copyright © 2019 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipSlider: UISlider!
    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var defaultSalesTaxSlider: UISlider!
    @IBOutlet weak var defaultSalesTaxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault = UserDefaults.standard

        defaultTipSlider.value = Float(userDefault.double(forKey: "tip") )
        defaultSalesTaxSlider.value = Float(userDefault.double(forKey: "tax") )
        
        defaultTipLabel.text = String(format: "%.2f", defaultTipSlider.value * 100)
        defaultSalesTaxLabel.text = String(format: "%.2f",
                                      defaultSalesTaxSlider.value * 100)
        
    }

    @IBAction func updateTipDefault(_ sender: Any) {
        let userDefault = UserDefaults()
        userDefault.set(defaultTipSlider.value, forKey: "tip")
        defaultTipLabel.text = String(format: "%.2f", defaultTipSlider.value * 100)
    
        userDefault.synchronize()
    }
    
    @IBAction func updateTaxDefault(_ sender: Any) {
        let userDefault = UserDefaults()
        userDefault.set(defaultSalesTaxSlider.value, forKey: "tax")
        defaultSalesTaxLabel.text = String(format: "%.2f", defaultSalesTaxSlider.value * 100)
        
        userDefault.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
