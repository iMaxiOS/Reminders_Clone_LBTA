//
//  ReminderCellView.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 20.06.2024.
//

import SwiftUI
import SwiftData


enum ReminderCellEvents {
    case onChecked(ReminderModel, Bool)
    case onSelec(ReminderModel)
    case onInfoSelected(ReminderModel)
}

struct ReminderCellView: View {
    
    let onEvent: (ReminderCellEvents) -> Void
    let reminder: ReminderModel
    let isSelected: Bool
    
    @State private var checked: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.circle.fill" : "circle")
                .font(.title2)
                .foregroundStyle(checked ? .green : .black)
                .padding([.trailing], 5)
                .onTapGesture {
                    checked.toggle()
                    onEvent(.onChecked(reminder, checked))
                }
            
            VStack(alignment: .leading) {
                Text(reminder.title)
                
                if let notes = reminder.notes {
                    Text(notes)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                HStack {
                    if let reminderDate = reminder.reminderDate {
                        Text(reminderDate.formatted())
                    }
                    
                    if let reminderDate = reminder.reminderTime {
                        Text(reminderDate.formatted(date: .omitted, time: .standard))
                    }
                }
                .font(.caption)
                .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "info.circle.fill")
                .opacity(isSelected ? 1 : 0)
                .onTapGesture {
                    onEvent(.onInfoSelected(reminder))
                }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onEvent(.onSelec(reminder))
        }
    }
}

struct ReminderCellViewContainer: View {
    
    @Query(sort: \ReminderModel.title) private var reminders: [ReminderModel]
    
    var body: some View {
        ReminderCellView(onEvent: { _ in } , reminder: reminders[0], isSelected: false)
    }
}

#Preview { @MainActor in
    ReminderCellViewContainer()
        .modelContainer(previewContainer)
}
