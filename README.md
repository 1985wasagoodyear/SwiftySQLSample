#  SwiftySQLSample

A simple app that demonstrates the usage of SQLite within Swift.


## Table of Contents
1. Installation
2. SQLite Considerations
3. Implementation in Swift
4. Notable Classes
5. References


## 1. Installation

1. Install pods with `pod install`
2. Build in `Xcode 11.0` or newer, with `Swift 5`.

### Dependencies

1. [fmdb](https://github.com/ccgus/fmdb)

A Cocoa / Objective-C wrapper around SQLite

2. [SwiftLint](https://github.com/realm/SwiftLint)

A tool to enforce Swift style and conventions.


## 2. SQLite Considerations

* SQLite is not thread-safe, thus you must treat all connections within one thread.
* Each database connection must always be closed when completed.
* SQLite is a relational database.
* `libsqlite3.tbd` is a library included on all iOS/macOS devices, thus it does not increase the binary size of your application
* As an older technology, the main interface is C.


## 3. Implementation in Swift

To use SQLite in Swift, we must be using C-code in Swift. 

This gives us three options.
* 1. Import `SQLite3` and use it directly in Swift, working with the C-style naming convention.
* 2. Use Objective-C as an intermediary for C-level SQLite, which we can then interface with, using Swift.
* 3. Use an existing framework that does 2. because it is a solved problem.

We will be using approach 3, with [fmdb](https://github.com/ccgus/fmdb).


## 4. Notable Classes

The primary class we will be interacting with is  `SQLiteManager`.

Of notability, the following CRUD functions are implemented:

### Create Table
* created automatically when an instance of `SQLiteManager` is instantiated, if the table does not already exist

### Create Entry
* `SQLiteManager+Create.swift`
* can press the `+` button at the top-left to call `addItemButtonAction` in `DatesListController`
* sets the current date and sets a random hexidecimal value for the name
* saves the entry within SQLite

### Read Entries
* `SQLiteManager+Read.swift`
* on app start, all entries are loaded into the table in `DatesListController`
* each create/update/delete also reloads all entries, for the sake of demonstration

### Update Entry
* `SQLiteManager+Update.swift`
* tapping on any entry on the table assigns a new hexidecimal value
* SQLite value is updated, then all entries are refreshed from the backing store

### Delete Entry
* `SQLiteManager+Delete.swift`
* swipe-left action on any entry allows for easy deletion
* implemented in respective UITableViewDelegate method 
`trailingSwipeActionsConfigurationForRowAt` or `editActionsForRowAt`, depending on OS version


## 5. References

[GeeksforGeeks SQL References](https://www.geeksforgeeks.org/sql-select-query/)

[AppCoda FMDB tutorial](https://www.appcoda.com/fmdb-sqlite-database/)
