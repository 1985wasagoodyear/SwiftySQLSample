//
//  String+Utility.swift
//  Created 3/20/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

extension String {
    static var randomHex: String {
        let range = 0x00000000...0xffffffff
        return String(format: "#%08X",
               Int.random(in: range))
    }
}
