//
//  MyListModel.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 18.06.2024.
//

import Foundation
import SwiftData

@Model
class MyListModel {
    var name: String
    var colorCode: String
    
    @Relationship(deleteRule: .cascade)
    var reminders: [ReminderModel] = []
    
    init(name: String, colorCode: String) {
        self.name = name
        self.colorCode = colorCode
    }
}
