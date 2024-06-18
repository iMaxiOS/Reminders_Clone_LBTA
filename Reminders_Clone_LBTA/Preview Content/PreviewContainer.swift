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
}
