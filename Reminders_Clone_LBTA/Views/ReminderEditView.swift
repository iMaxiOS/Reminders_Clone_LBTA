//
//  ReminderEditView.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 21.06.2024.
//

import SwiftUI
import SwiftData

struct ReminderEditView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var notes: String = ""
    @State private var reminderDate: Date = .now
    @State private var reminderTime: Date = .now
    @State private var showCalendar: Bool = false
    @State private var showTime: Bool = false
    
    let reminder: ReminderModel
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Notes", text: $notes)
            }
            
            Section {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundStyle(.red)
                        .font(.title2)
                    
                    Toggle(isOn: $showCalendar) {
                        EmptyView()
                    }
                }
                
                if showCalendar {
                    DatePicker("SELECT DATE", selection: $reminderDate, displayedComponents: .date)
                }
                
                HStack {
                    Image(systemName: "clock")
                        .foregroundStyle(.blue)
                        .font(.title2)
                    
                    Toggle(isOn: $showTime) {
                        EmptyView()
                    }
                }
                
                
                if showTime {
                    DatePicker("SELECT DATE", selection: $reminderTime, displayedComponents: .hourAndMinute)
                }
            }
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: showTime) { oldValue, newValue in
            if newValue {
                showCalendar = true
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
                .bold()
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    updateReminder()
                }
                .disabled(!isFormValid)
                .bold()
            }
        }
        .onAppear {
            getReminderData()
        }
    }
}

private extension ReminderEditView {
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace
    }
    
    func updateReminder() {
        reminder.title = title
        reminder.notes = notes.isEmpty ? nil : notes
        reminder.reminderDate = showCalendar ? reminderDate : nil
        reminder.reminderTime = showTime ? reminderTime : nil
        dismiss()
    }
    
    func getReminderData() {
        title = reminder.title
        notes = reminder.notes ?? ""
        reminderDate = reminder.reminderDate ?? .now
        reminderTime = reminder.reminderTime ?? .now
        showCalendar = reminder.reminderDate != nil
        showTime = reminder.reminderTime != nil
    }
}

struct ReminderEditViewContainer: View {
    
    @Query(sort: \ReminderModel.title) private var reminders: [ReminderModel]
    
    var body: some View {
        ReminderEditView(reminder: reminders[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        ReminderEditViewContainer()
    }
    .modelContainer(previewContainer)
}
