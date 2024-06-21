//
//  MyListDetailView.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 18.06.2024.
//

import SwiftUI
import SwiftData

struct MyListDetailView: View {
    
    @State private var title: String = ""
    @State private var isNewReminderPresented: Bool = false
    
    let myList: MyListModel
    
    var body: some View {
        VStack {
            List {
                ForEach(myList.reminders) { reminder in
                    ReminderCellView(onEvent: { event in
                        switch event {
                        case .onChecked(let reminderModel, let bool):
                            print("onChecked")
                        case .onSelec(let reminderModel):
                            print("selec")
                        case .onInfoSelected(let reminderModel):
                            print("Info")
                        }
                    },
                    reminder: reminder,
                    isSelected: false)
                }
            }
            
            Spacer()
            
            Button {
                isNewReminderPresented = true
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("New Reminder")
                        .bold()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle(myList.name)
        .alert("New Reminder", isPresented: $isNewReminderPresented) {
            TextField("", text: $title)
            Button("Cancel", role: .cancel) { }
            Button("Done") {
                if isFormValid {
                    saveReminder()
                }
            }
        }
    }
}

private extension MyListDetailView {
    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace
    }
    
    private func saveReminder() {
        let reminder = ReminderModel(title: title)
        myList.reminders.append(reminder)
        title = ""
    }
}

struct MyListDetailViewContainer: View {
    
    @Query private var myLists: [MyListModel]
    
    var body: some View {
        MyListDetailView(myList: myLists[0])
    }
}

#Preview { @MainActor in 
    NavigationStack {
        MyListDetailViewContainer()
    }
    .modelContainer(previewContainer)
}
