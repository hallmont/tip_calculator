//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by John Nguyen on 7/16/17.
//  Copyright © 2017 John Nguyen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update tip percentage from UserDefaults
        tipControl.selectedSegmentIndex = Helper.getTipControlIndexFromDefaults();
    }
    
    @IBAction func tipControlValueChanged(_ sender: Any) {
        updateDefaultTipPercentage()
    }
    
    func updateDefaultTipPercentage() {
        
        let defaults = UserDefaults.standard
        
        // Store selected percentage value to UserDefaults
        let selectedPercentageValue = kTipPercentages[tipControl.selectedSegmentIndex]
        
        defaults.set( selectedPercentageValue, forKey: kTipPercentageKey )
        
        defaults.synchronize()
    }
}
