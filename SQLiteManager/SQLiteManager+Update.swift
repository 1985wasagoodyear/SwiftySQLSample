//
//  SQLiteManager+Update.swift
//  Created 3/18/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation
import FMDB

extension SQLiteManager {
    
    func update(_ item: DateItem, with name: String) throws {
        let query =
        """
        UPDATE DateItem
        SET name = '\(name)'
        WHERE id = \(item.dateId);
        """
        
        do {
            try database.executeUpdate(query, values: [])
        } catch {
            throw SQLiteManagerError.queryError(error)
        }
    }
}
