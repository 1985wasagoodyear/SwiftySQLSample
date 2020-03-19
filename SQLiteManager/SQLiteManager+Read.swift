//
//  SQLiteManager+Read.swift
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
    func fetchAll() throws -> [DateItem] {
        let query = "SELECT * FROM DateItem"
        
        do {
            let sqlResults: FMResultSet = try database.executeQuery(query,
                                                                    values: [])
            var results: [DateItem] = []
            while sqlResults.next() {
                guard let name = sqlResults.string(forColumn: "name"),
                    let date = sqlResults.string(forColumn: "date")
                    else { continue }
                let item = DateItem(dateId: Int(sqlResults.int(forColumn: "id")),
                                    name: name,
                                    dateString: date)
                results.append(item)
            }
            currId = results.max { $0.dateId > $1.dateId }?.dateId ?? 0
            return results
        } catch {
            throw SQLiteManagerError.queryError(error)
        }
    }
}
