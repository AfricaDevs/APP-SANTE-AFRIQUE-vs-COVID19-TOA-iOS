//
//  BottomBarExperimentView.swift
//  TOA
//
//  Created by Steven on 7/13/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

let items: [BottomBarItem] = [
    BottomBarItem(icon: "house.fill", title: "Home", color: .purple),
    BottomBarItem(icon: "heart", title: "Likes", color: .pink),
    BottomBarItem(icon: "magnifyingglass", title: "Search", color: .orange),
    BottomBarItem(icon: "person.fill", title: "Profile", color: .blue)
]

struct BasicView: View {
    let item: BottomBarItem
   
var body: some View {
    VStack {
        Spacer()
 
Text("hello there ")
        Spacer()
        }
    }
}

struct BottomBarExperimentView : View {
    @State private var selectedIndex: Int = 0

    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }

var body: some View {
        NavigationView {
            VStack {
                BasicView(item: selectedItem)
                    .navigationBarTitle(Text(selectedItem.title))
                BottomBar(selectedIndex: $selectedIndex, items: items)
            }
        }
    }
}

struct BottomBarExperimentView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarExperimentView()
    }
}
