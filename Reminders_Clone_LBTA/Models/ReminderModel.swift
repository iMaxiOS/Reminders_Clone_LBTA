//
//  ReminderModel.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 18.06.2024.
//

import Foundation
import SwiftData

@Model
final class ReminderModel {
    var title: String
    var notes: String?
    var isCompleted: Bool
    var reminderDate: Date?
    var reminderTime: Date?
    
    var list: MyListModel?
    
    
    init(
        title: String,
        notes: String? = nil,
        isCompleted: Bool = false,
        reminderDate: Date? = nil,
        reminderTime: Date? = nil,
        list: MyListModel? = nil
    ) {
        self.title = title
        self.notes = notes
        self.isCompleted = isCompleted
        self.reminderDate = reminderDate
        self.reminderTime = reminderTime
        self.list = list
    }
}
