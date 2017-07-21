//
//  UIColor_Extension.swift
//  TipCalculator
//
//  Created by John Nguyen on 7/21/17.
//  Copyright © 2017 John Nguyen. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init (rgbString:String, alpha:Double=1.0 ) {
        let rgbValue = Int( rgbString, radix: 16 ) ?? 0
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        self.init(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}
