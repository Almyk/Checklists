//
//  ChecklistItem.swift
//  Checklist1
//
//  Created by Tommy Hansen on 14/04/2019.
//  Copyright © 2019 Tommy Hansen. All rights reserved.
//

import Foundation

class ChecklistItem:NSObject, Codable {
    var text = ""
    var checked = false
    func toggleChecked() {
        checked = !checked;
    }
}
