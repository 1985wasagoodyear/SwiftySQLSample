//
//  DateItem.swift
//  Created 3/19/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

struct DateItem {
    let dateId: Int
    let name: String
    let dateString: String
}

extension String {
    static var randomHex: String {
        String(format: "%02X",
               Int.random(in: 100_000_000...999_999_999))
    }
}
