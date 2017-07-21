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
    
    @IBOutlet weak var topPanel: UIView!
    @IBOutlet weak var bottomPanel: UIView!
    @IBOutlet weak var themeImage: UIImageView!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register to be notified when app goes to the background
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
    }
    
    func appMovedToBackground() {
        defaults.setAppBackgroundTime()
        defaults.setBillAmount(amount: Double(billField.text!) ?? 0 )
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
        
        // Restore last "bill" value if accessed within 10 minutes
        if( Helper.getMinutesSinceLastAccess() <= 10.0 ) {
            let bill = defaults.getBillAmount()
            if( bill != 0.0 ) {
                billField.text = String( bill )
            }
        }
        
        // Update tip percentage from UserDefaults
        tipControl.selectedSegmentIndex = defaults.getTipPercentageIndex()

        updateTip()
        updateTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        billField.becomeFirstResponder()
    }
    
    func updateTheme()
    {
        let theme = themes[ defaults.getTheme() ]!

        topPanel.backgroundColor = UIColor.init( rgbString: theme["topPanelColor"]! )
        bottomPanel.backgroundColor = UIColor.init( rgbString: theme["bottomPanelColor"]! )
        tipControl.backgroundColor = topPanel.backgroundColor
        themeImage.image = UIImage( named: theme["image"]!)
        
    }
}

