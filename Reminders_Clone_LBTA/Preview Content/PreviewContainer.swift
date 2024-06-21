//
//  PreviewContainer.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 18.06.2024.
//

import Foundation
import SwiftData

@MainActor
var previewContainer: ModelContainer = {
    let container = try! ModelContainer(for: MyListModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for myList in SampleData.myLists {
        container.mainContext.insert(myList)
        myList.reminders = SampleData.reminders
    }
    
    return container
}()

struct SampleData {
    static var myLists: [MyListModel] {
         [
             MyListModel(name: "Reminders", colorCode: "#2ecc71"),
             MyListModel(name: "Backlog", colorCode: "#9b59b6")
         ]
    }
    
    static var reminders: [ReminderModel] {
         [
            ReminderModel(title: "Reminder 1", notes: "This is a reminder 1 note", reminderDate: Date(), reminderTime: Date()),
            ReminderModel(title: "Reminder 2"),
            ReminderModel(title: "Reminder 3", notes: "This is a reminder 3 note")
         ]
    }
}
