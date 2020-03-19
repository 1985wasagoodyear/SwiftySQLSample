//
//  DatesListController.swift
//  Created 3/18/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

private let reuseID = "DateItemTableViewCell"

class DatesListController: UIViewController {
    
    // MARK: - Storyboard Outlets
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            let nib = UINib(nibName: "DateItemTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: reuseID)
        }
    }
    
    // MARK: - Properties
    
    lazy var manager: SQLiteManager = {
        do {
            guard let url = FileManager
                .default
                .urls(for: .documentDirectory,
                      in: .userDomainMask)
                .first?
                .appendingPathComponent("dateItems.sqlite3") else {
                    fatalError("URL not available")
            }
            return try SQLiteManager(url: url)
        } catch {
            fatalError("Could not instantiate SQLite store")
        }
    }()
    
    let tableName = "DateItem"
    var items: [DateItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadItems()
    }

    // MARK: - Custom Action Methods
    
    @IBAction func addItemButtonAction(_ sender: Any) {
        let date = dateFormatter.string(from: Date())
        try? manager.makeDateItem(name: .randomHex,
                                  date: date)
        reloadItems()
    }
    
    // MARK: - SQLite Manager Helper Methods
    
    func reloadItems() {
        items = (try? manager.fetchAll()) ?? []
    }
    
    func deleteItem(at index: Int) {
        let item = items.remove(at: index)
        try? manager.delete(item, from: tableName)
        reloadItems()
    }
}
