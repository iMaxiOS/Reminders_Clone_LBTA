//
//  MyListsView.swift
//  Reminders_Clone_LBTA
//
//  Created by iMac on 18.06.2024.
//

import SwiftUI
import SwiftData

struct MyListsView: View {
    
    @State private var isPresented: Bool = false
    
    @Query private var myLists: [MyListModel]
    
    var body: some View {
        List {
            Text("My Lists")
                .font(.largeTitle.bold())
            
            ForEach(myLists) { list in
                HStack {
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .font(.system(size: 32).bold())
                        .foregroundStyle(Color(hex: list.colorCode))
                    Text(list.name)
                }
            }
            
            Button {
                isPresented = true
            } label: {
                Text("Add List")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .sheet(isPresented: $isPresented, content: {
            NavigationStack {
                AddMyListView()
            }
        })
    }
}

#Preview { @MainActor in
    MyListsView()
        .modelContainer(previewContainer)
}
