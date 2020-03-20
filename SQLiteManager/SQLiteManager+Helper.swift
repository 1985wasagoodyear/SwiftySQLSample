//
//  SQLiteManager+Helper.swift
//  Created 3/20/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation
import FMDB

extension SQLiteManager {
    func executeUpdate(_ sql: String, values: [Any]? = []) throws {
        do {
            try database.executeUpdate(sql, values: values)
        } catch {
            throw SQLiteManagerError.queryError(error)
        }
    }
}
