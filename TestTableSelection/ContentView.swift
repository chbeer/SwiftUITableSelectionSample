//
//  ContentView.swift
//  TestTableSelection
//
//  Created by Christian Beer on 03.06.25.
//

import SwiftUI

struct ContentView: View {
    
    struct Item: Identifiable {
        let id = UUID()
        let title: String
    }
    
    let items: [Item] = [
        .init(title: "A"),
        .init(title: "B")
    ]
    
    @State var selection: Set<Item.ID> = []
    @State var openSheet = false
    
    var body: some View {
        NavigationStack {
            Table(items, selection: $selection) {
                TableColumn("Title", value: \.title)
            }
            .toolbar {
                EditButton()
                
                Button("Sheet") {
                    openSheet = true
                }
            }
            .sheet(isPresented: $openSheet) {
                NavigationStack {
                    Text("X")
                        .presentationDetents([.medium])
                        .toolbar {
                            Button("Close") { openSheet = false }
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
