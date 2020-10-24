//
//  Grid.swift
//  Memorize
//
//  Created by Qxt_circle on 2020/10/19.
//


import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(items) { item in
                let layout: GridLayout = GridLayout(itemCount: items.count, in: geometry.size)
                let index = items.firstIndex(matching: item)!
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index))
            }
        }
    }
}

/*
 struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}
*/
