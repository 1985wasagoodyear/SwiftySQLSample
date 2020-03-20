//
//  SQLiteManager+Delete.swift
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
    func delete(_ item: DateItem, from tableName: String) throws {
        let updateSql =
        """
        DELETE FROM \(tableName)
        WHERE id = \(item.dateId);
        """
        try executeUpdate(updateSql)
    }
}
