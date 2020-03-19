//
//  SQLiteManager+Create.swift
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
    func makeTable() throws {
        if database.tableExists("DateItem") {
            throw SQLiteManagerError.tableAlreadyExists
        }
        
        let query =
        """
        CREATE TABLE DateItem
        (
            id int(255),
            name varchar(255),
            date varchar(255)
        );
        """
        do {
            try database.executeUpdate(query, values: [])
        } catch {
            throw SQLiteManagerError.queryError(error)
        }
    }
    
    func makeDateItem(name: String, date: String) throws {
        currId += 1
        
        let query =
        """
        INSERT INTO DateItem (id, name, date)
        VALUES ('\(currId)', '\(name)', '\(date)');
        """
        
        do {
            try database.executeUpdate(query, values: [])
        } catch {
            throw SQLiteManagerError.queryError(error)
        }
    }
}
