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

extension Array where Element == DateItem {
    init(from resultSet: FMResultSet) {
        self = []
        reserveCapacity(Int(resultSet.columnCount))
        while resultSet.next() {
            guard let item = DateItem(resultSet: resultSet) else { return }
            append(item)
        }
    }
}

extension DateItem {
    init?(resultSet: FMResultSet) {
        guard let name = resultSet.string(forColumn: "name"),
            let date = resultSet.string(forColumn: "date")
            else { return nil }
        let dateId = Int(resultSet.int(forColumn: "id"))
        self = DateItem(dateId: dateId,
                        name: name,
                        dateString: date)
    }
}
