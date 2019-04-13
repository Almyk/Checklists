//
//  ViewController.swift
//  Checklist1
//
//  Created by Tommy Hansen on 13/04/2019.
//  Copyright © 2019 Tommy Hansen. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item0 = ChecklistItem()
        item0.text = "Walk the dog"
        items.append(item0)
        
        let item1 = ChecklistItem()
        item1.text = "Brush my teeth"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Learn iOS development"
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Soccer practice"
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Eat ice cream"
        items.append(item4)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        
        configureCheckmark(for: cell, with: item)
        configureText(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }

}

