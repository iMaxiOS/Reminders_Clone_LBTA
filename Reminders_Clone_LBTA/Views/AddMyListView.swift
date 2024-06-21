//
//  AddMyListView.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 18.06.2024.
//

import SwiftUI
import SwiftData

struct AddMyListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var color: Color = .blue
    @State private var listName: String = ""
    
    @Namespace var animation
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "line.3.horizontal.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(color)
                
                TextField("List name", text: $listName)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
                
                ColorPickerView(selectedColor: $color)
                    .matchedGeometryEffect(id: "ANIMATION", in: animation)
            }
            .navigationTitle("New List")
             .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Clone") {
                        dismiss()
                    }
                    .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        guard let hex = color.toHex() else { return }
                        let myList = MyListModel(name: listName, colorCode: hex)
                        context.insert(myList)
                        dismiss()
                    }
                    .bold()
                }
            }
        }
    }
}

#Preview { @MainActor in
    AddMyListView()
        .modelContainer(previewContainer)
}
