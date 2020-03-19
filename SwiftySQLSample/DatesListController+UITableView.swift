//
//  DatesListController+UITableView.swift
//  Created 3/19/20
//  Using Swift 5.0
// 
//  Copyright © 2020 Yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import UIKit

extension DatesListController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DateItemTableViewCell",
                                                       for: indexPath) as? DateItemTableViewCell else {
                                                        fatalError("Could not dequeue a cell")
        }
        
        let item = items[indexPath.row]
        
        cell.nameLabel.text = item.name
        cell.dateCreatedLabel.text = "Date created: " + item.dateString
        
        return cell
    }
}

extension DatesListController: UITableViewDelegate {
    #if compiler(>=5)
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "DELETE") { (_, _, _) in
            self.deleteItem(at: indexPath.row)
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    #endif
    trailingSwipeActionsConfigurationForRowAt
    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .destructive, title: "DELETE!") { (_, _) in
            self.deleteItem(at: indexPath.row)
        }
        return [action]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        try? manager.update(items[indexPath.row], with: .randomHex)
        reloadItems()
    }
    
}
