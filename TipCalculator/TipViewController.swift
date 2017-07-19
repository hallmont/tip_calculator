//
//  TipViewController.swift
//  TipCalculator
//
//  Created by John Nguyen on 7/16/17.
//  Copyright © 2017 John Nguyen. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func billFieldChanged(_ sender: Any) {
        updateTip()
    }
    
    @IBAction func tipControlValueChanged(_ sender: Any) {
        updateTip()
    }
    
    func updateTip()
    {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * kTipPercentages[ tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update tip percentage from UserDefaults
        tipControl.selectedSegmentIndex = Helper.getTipControlIndexFromDefaults();
        
        updateTip()
    }
}

