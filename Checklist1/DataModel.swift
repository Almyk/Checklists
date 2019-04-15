//
//  DataModel.swift
//  Checklist1
//
//  Created by Tommy Hansen on 15/04/2019.
//  Copyright © 2019 Tommy Hansen. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    // file I/O
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }

    // saving the file
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoid imte array: \(error.localizedDescription)")
        }
    }

    // loading the file
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoing item array: \(error.localizedDescription)")
            }
        }
    }
}
