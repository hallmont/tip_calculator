//
//  Helper.swift
//  TipCalculator
//
//  Created by John Nguyen on 7/18/17.
//  Copyright © 2017 John Nguyen. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    static func getMinutesSinceLastAccess() -> Double
    {
        let defaults = UserDefaults.standard
        
        let now = NSDate().timeIntervalSince1970
        let elapsedMinutes = ( now - defaults.getAppBackgroundTime() ) / 60.0
        
        return elapsedMinutes
    }

}
