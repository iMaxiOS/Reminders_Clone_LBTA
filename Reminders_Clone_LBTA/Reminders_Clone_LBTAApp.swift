//
//  Reminders_Clone_LBTAApp.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 18.06.2024.
//

import SwiftUI

@main
struct Reminders_Clone_LBTAApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MyListsView()
            }
            .modelContainer(for: MyListModel.self)
        }
    }
}
