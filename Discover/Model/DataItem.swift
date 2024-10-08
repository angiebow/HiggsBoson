//
//  DataItem.swift
//  carbonPrint
//
//  Created by Pelangi Masita Wati on 05/10/24.
//

import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    
    var id: String
    var name: String
    var date: Date = Date()
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.date = Date()
    }
}
