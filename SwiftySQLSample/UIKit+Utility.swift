//
//  UIKit+Utility.swift
//  Created 3/20/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

// https://www.hackingwithswift.com/example-code/uicolor/how-to-convert-a-hex-color-to-a-uicolor
extension UIColor {
    public convenience init?(hex: String) {
        // ensure the hexidecimal string is of the proper length & form
        guard hex.hasPrefix("#"), hex.count == 9 else { return nil }
        
        let hexColor = String(hex.dropFirst())
        let scanner = Scanner(string: hexColor)

        var hexNumber: UInt64 = 0
        guard scanner.scanHexInt64(&hexNumber) else { return nil }
        
        let red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        let green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        let blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        let alpha = CGFloat(hexNumber & 0x000000ff) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIView {
    func roundify() {
        layer.cornerRadius = 16.0
        layer.masksToBounds = true
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
}
