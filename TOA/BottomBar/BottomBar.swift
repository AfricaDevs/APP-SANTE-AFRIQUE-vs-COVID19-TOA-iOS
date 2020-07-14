//
//  BottomBar.swift
//  BottomBar
//
//  Created by Bezhan Odinaev on 7/2/19.
//  Copyright © 2019 Bezhan Odinaev. All rights reserved.
//

import SwiftUI

public struct BottomBar : View {
    @Binding public var selectedIndex: Int
    public let items: [BottomBarItem]
    
    public init(selectedIndex: Binding<Int>, items: [BottomBarItem]) {
        self._selectedIndex = selectedIndex
        self.items = items
    }
    
    
    public init(selectedIndex: Binding<Int>, @BarBuilder items: () -> [BottomBarItem]){
        self = BottomBar(selectedIndex: selectedIndex,
                         items: items())
    }
    
    
    public init(selectedIndex: Binding<Int>, item: BottomBarItem){
        self = BottomBar(selectedIndex: selectedIndex,
                         items: [item])
    }
    
    
    func itemView(at index: Int) -> some View {
        Button(action: {
            withAnimation { self.selectedIndex = index }
        }) {
            BottomBarItemView(selected: self.$selectedIndex,
                              index: index,
                              item: items[index])
        }
    }
    
    public var body: some View {
        HStack(alignment: .bottom) {
            ForEach(0..<items.count) { index in
                self.itemView(at: index)
                
                if index != self.items.count-1 {
                    Spacer()
                }
            }
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .animation(.default)
    }
}

struct BottomBar_Previews : PreviewProvider {
    static var previews: some View {
        BottomBar(selectedIndex: .constant(0), items:  [BottomBarItem(icon: "hand.raised", title: NSLocalizedString("lWhy", comment: ""), color: .green),
                                                        BottomBarItem(icon: "hand.raised", title: NSLocalizedString("lHow", comment: ""), color: .blue),
                                                        BottomBarItem(icon: "hand.raised", title: NSLocalizedString("lWhen", comment: ""), color: .purple)])
    }
}


@_functionBuilder
public struct BarBuilder{}


public extension BarBuilder{
    static func buildBlock(_ items: BottomBarItem...) -> [BottomBarItem]{
        items
    }
}
