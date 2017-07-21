//
//  UserDefaults_Extension.swift
//  TipCalculator
//
//  Created by John Nguyen on 7/19/17.
//  Copyright © 2017 John Nguyen. All rights reserved.
//

import Foundation

let kTipPercentageKey = "tipPercentage"
let kLastAccessedTime = "lastAccessedTime"
let kBillAmountKey = "billAmount"
let kTheme = "theme"

extension UserDefaults {
    func setTipPercentage( tipPercent: Double ) {
        set( tipPercent, forKey: kTipPercentageKey )
    }
    
    func getTipPercentage() -> Double {
        return double(forKey: kTipPercentageKey )
    }
    
    func getTipPercentageIndex() -> Int {
        return kTipPercentages.index( of: getTipPercentage() ) ?? 0
    }
    
    func setAppBackgroundTime() {
        let now = NSDate().timeIntervalSince1970
        
        // Update app's last accessed time in UserDefaults
        set( now, forKey: kLastAccessedTime )
    }
    
    func getAppBackgroundTime() -> Double {
        return double( forKey: kLastAccessedTime )
    }
    
    func setBillAmount( amount: Double ) {
        set( amount, forKey: kBillAmountKey )
    }
    
    func getBillAmount() -> Double {
        return double(forKey: kBillAmountKey )
    }
    
    func setTheme( name: String ) {
        set( name, forKey: kTheme )
    }
    
    func getTheme() -> String {
        return string(forKey: kTheme ) ?? kThemes[0]
    }
    
    func getThemeIndex() -> Int {
        return kThemes.index( of: getTheme() ) ?? 0
    }
}
