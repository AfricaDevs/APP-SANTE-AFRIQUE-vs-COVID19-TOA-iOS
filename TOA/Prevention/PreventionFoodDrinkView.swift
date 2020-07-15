//
//  PreventionFoodDrinkView.swift
//  TOA
//
//  Created by Steven on 7/15/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct PreventionFoodDrinkView: View {
    
    @EnvironmentObject var settings: UserSettings
    @State private var selectedIndex = 0
    let bottomItems = [
        BottomBarItem(icon: "tuningfork", title: NSLocalizedString("tabFood", comment: ""), color: .blue),
        BottomBarItem(icon: "loupe", title: NSLocalizedString("tabDrinks", comment: ""), color: .green)
    ]
    
    var body: some View {
        
        VStack {
            if self.selectedIndex == 0 {
                PreventionFoodView()
            }
            if self.selectedIndex == 1 {
                PreventionDrinkView()
            }
            
            Spacer()
            
            BottomBar(selectedIndex: $selectedIndex, items: bottomItems).padding(.horizontal, 10)
        }
        .navigationBarTitle("preventionFoodDrinkToolbarTitle", displayMode: .inline)
        .navigationBarItems(trailing: ToolbarItem().onTapGesture {
            self.settings.textSize.toggle()
            
            UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
        })
    }
}


struct PreventionFoodView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack{
            
            Spacer(minLength: 10)
            
            Text("preventionFoodTitle")
            .font(  self.settings.textSize ?  .body: .system(size: 20))
            .fontWeight(.bold)
            
            List{
                ForEach(preventionFoodImages){ cell in
                    HStack {
                        Spacer()
                        Image(cell.preventionFoodItem.image)
                            .resizable()
                            //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 120, alignment: .top)
                            .frame(width: 160, height: 120)
                            .aspectRatio(contentMode: ContentMode.fit)
                        Spacer()
                        Image(cell.preventionFoodItem2.image)
                            .resizable()
                            //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 120, alignment: .top)
                            .frame(width: 160, height: 120)
                            .aspectRatio(contentMode: ContentMode.fit)
                        Spacer()
                    }
                }
            }
                
            ScrollView{
                Text("preventionFood")
                    .font(  self.settings.textSize ? .body: .system(size: 20))
                    .padding()
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 180, alignment: .top)
            
        }
    }
}


struct PreventionDrinkView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack{
            Spacer(minLength: 10)
            HStack{
            Text("preventionDrinkTitle")
            .font(  self.settings.textSize ?  .body: .system(size: 20))
            .fontWeight(.bold).padding()
                Spacer()
            }
            List{
                ForEach(preventionDrinkImages){ cell in
                    HStack {
                         Spacer()
                        Image(cell.preventionFoodItem.image)
                            .resizable()
                            .frame(width: !cell.preventionFoodItem2.image.isEmpty ? 160 : 320, height: 120)
                            .aspectRatio(contentMode: ContentMode.fit)
                        
                        Spacer()

                        /* string is not blank - 2 columns SPAN check */
                        if !cell.preventionFoodItem2.image.isEmpty {
                            
                            Image(cell.preventionFoodItem2.image)
                                .resizable()
                                .frame(width: 160, height: 120)
                                .aspectRatio(contentMode: ContentMode.fit)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
