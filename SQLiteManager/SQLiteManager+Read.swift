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
        
        let sqlQuery = "SELECT * FROM DateItem"
        
        do {
            let sqlResults: FMResultSet = try database.executeQuery(sqlQuery,
                                                                    values: [])
            let results = [DateItem](from: sqlResults)
            currId = results.max { $0.dateId < $1.dateId }?.dateId ?? 0
            
            return results
        } catch {
            throw SQLiteManagerError.queryError(error)
        }
    }
}
