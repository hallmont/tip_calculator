//
//  Helper.swift
//  TipCalculator
//
//  Created by John Nguyen on 7/18/17.
//  Copyright © 2017 John Nguyen. All rights reserved.
//

import Foundation

class Helper {
    
    static func getTipControlIndexFromDefaults() -> Int {
        let defaults = UserDefaults.standard
        let value = defaults.double(forKey: kTipPercentageKey )
        let index = kTipPercentages.index( of: value ) ?? 0
        
        return index
    }
}
