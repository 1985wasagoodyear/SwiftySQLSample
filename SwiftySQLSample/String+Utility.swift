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
    // from 0x10000000 to 0xffffffff
    // is there an easier way to write fixed-width 8-character hex strings?
    static var randomHex: String {
        String(format: "#%02X",
               Int.random(in: 268_435_456...4_294_967_295))
    }
}
