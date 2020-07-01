//
//  ContentView.swift
//  OutlineGroup
//
//  Created by Abdelrahman Mohamed on 1.07.2020.
//

import SwiftUI

struct ListItem: Identifiable {

    let id: UUID = UUID()
    let name: String
    var items: [ListItem]?
}

extension ListItem {

    static func all() -> [ListItem] {

        let animals = [ListItem(name: "🐶"), ListItem(name: "🐰")]
        let fruits = [ListItem(name: "🍑"), ListItem(name: "🍉"), ListItem(name: "🍌")]
        let cars = [ListItem(name: "🚗"), ListItem(name: "🏎"), ListItem(name: "🚓"), ListItem(name: "🚑"), ListItem(name: "🚜")]
        return [
            ListItem(name: "Animals", items: animals),
            ListItem(name: "Fruits", items: fruits),
            ListItem(name: "Cars", items: cars),
        ]
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(ListItem.all()) { category in
                    Section(header: EmptyView()) {
                        OutlineGroup(category, children: \.items) { item in
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("OutlineGroup")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
