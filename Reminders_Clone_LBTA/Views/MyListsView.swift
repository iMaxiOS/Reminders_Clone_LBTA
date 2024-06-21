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
        NavigationStack {
            List {
                ForEach(myLists) { list in
                    NavigationLink {
                        MyListDetailView(myList: list)
                    } label: {
                        HStack {
                            Image(systemName: "line.3.horizontal.circle.fill")
                                .font(.system(size: 32).bold())
                                .foregroundStyle(Color(hex: list.colorCode))
                            Text(list.name)
                        }
                    }
                }
                
                Button {
                    isPresented = true
                } label: {
                    Text("Add List")
                        .foregroundStyle(.accent)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .listRowSeparator(.hidden)
            }
            .bold()
            .listStyle(.plain)
            .navigationTitle("My Lists")
            .sheet(isPresented: $isPresented, content: {
                AddMyListView()
            })
        }
    }
}

#Preview { @MainActor in
    MyListsView()
        .modelContainer(previewContainer)
}
