//
//  SQLiteManagerError.swift
//  Created 3/18/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

enum SQLiteManagerError: Error {
    case dbNotFound
    case queryError(Error)
    case couldNotOpen
    case tableAlreadyExists
    case unknown(Error)
}
