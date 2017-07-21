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
    @IBOutlet weak var themeControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update tip percentage from UserDefaults
        tipControl.selectedSegmentIndex = defaults.getTipPercentageIndex()
        themeControl.selectedSegmentIndex = defaults.getThemeIndex()
    }
    
    @IBAction func tipControlValueChanged(_ sender: Any) {
        updateDefaultTipPercentage()
    }
    
    func updateDefaultTipPercentage() {
        
        // Store selected percentage value to UserDefaults
        let selectedPercentageValue = kTipPercentages[tipControl.selectedSegmentIndex]

        defaults.setTipPercentage(tipPercent: selectedPercentageValue)
        
        defaults.synchronize()
    }
    
    @IBAction func themeChanged(_ sender: Any) {
        
        let selectedTheme = kThemes[ themeControl.selectedSegmentIndex ]
        defaults.setTheme(name: selectedTheme)
        defaults.synchronize()
    }
}
