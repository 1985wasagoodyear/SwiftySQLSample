//
//  SQLiteManager.swift
//  Created 3/18/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation
import FMDB

private let fileType = "sqlite3"
private let fileManager = FileManager.default

typealias AnyDict = [String: Any]

class SQLiteManager {

    var databasePath: String?
    let database: FMDatabase
    var currId: Int = 0
    
    required init(path databasePath: String? = nil) throws {
        self.databasePath = databasePath
        database = FMDatabase(path: databasePath)
        if database.open() {
            try? self.makeTable()
        } else {
            throw SQLiteManagerError.couldNotOpen
        }
    }
    
    deinit {
        if database.isOpen == true {
            database.close()
        }
    }
}

// MARK: - Convenience Initializers

extension SQLiteManager {
    convenience init(bundle databaseName: String) throws {
        guard let path = Bundle
            .main
            .path(forResource: databaseName,
                  ofType: fileType) else {
                    throw SQLiteManagerError.dbNotFound
        }
        try self.init(path: path)
    }
    
    convenience init(url: URL) throws {
        try self.init(path: url.path)
    }
    
    class func inMemorySQLiteDB() throws -> SQLiteManager {
        do {
            return try self.init()
        } catch {
            throw SQLiteManagerError.unknown(error)
        }
    }
}

// MARK: - Convenience FileManager Methods

extension SQLiteManager {
    class func deleteDB(url: URL) throws {
        try fileManager.removeItem(at: url)
    }
}
