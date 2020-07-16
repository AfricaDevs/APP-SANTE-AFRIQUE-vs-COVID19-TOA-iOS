//
//  PreventionMovementView.swift
//  TOA
//
//  Created by Steven on 7/15/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct PreventionMovementView: View {

    @EnvironmentObject var settings: UserSettings
    @State private var selectedIndex = 0
    
    let bottomItems = [BottomBarItem(icon: "questionmark.square.dashed", title: NSLocalizedString("lWhy", comment: ""), color: .green),
                       
                       BottomBarItem(icon: "timer.square", title: NSLocalizedString("lWhen", comment: ""), color: .purple),
                       BottomBarItem(icon: "a.book.closed", title: NSLocalizedString("lHow", comment: ""), color: .blue)
    ]
    
    var body: some View {
        
        VStack {
            if self.selectedIndex == 0 {
                MovementWhyView()
            }
            if self.selectedIndex == 1 {
                MovementWhenView()
            }
            if self.selectedIndex == 2 {
                MovementHowView()
            }
            
            Spacer()
            
            BottomBar(selectedIndex: $selectedIndex, items: bottomItems)
        }
        .navigationBarTitle("preventionHandsToolbarTitle", displayMode: .inline)
        .navigationBarItems(trailing: ToolbarItem().onTapGesture {
            self.settings.textSize.toggle()
            
            UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
        })
    }
}
 
struct MovementWhyView: View{
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View{
    ScrollView{
        VStack (alignment: .leading, spacing: 10){
            
            HStack{
                Text("preventionMovementTitleWhy")
                    .font(  self.settings.textSize ? .system(size: 20): .system(size: 22))
                    .fontWeight(.bold)
                Spacer()
            }
            

            HStack{
                Text("preventionMovementWhy")
                    .font(  self.settings.textSize ?   .body : .system(size: 20))
                 
            }
        }
}
}
}



struct MovementWhenView: View{
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View{
     
        VStack (alignment: .leading, spacing: 10){
            
            HStack{
                Text("preventionMovementTitleWhen")
                    .font(  self.settings.textSize ? .system(size: 20): .system(size: 22))
                    .fontWeight(.bold)
                Spacer()
            }
            
 
        }
        
    }
}



struct MovementHowView: View{
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View{
    ScrollView{
        VStack (alignment: .leading, spacing: 10){
            
            HStack{
                Text("preventionMovementTitleHow")
                    .font(  self.settings.textSize ? .system(size: 20): .system(size: 22))
                    .fontWeight(.bold)
                Spacer()
            }
            

            HStack{
                Text("preventionMovementHow")
                    .font(  self.settings.textSize ?   .body : .system(size: 20))
                 
            }
        }
}
}
}
