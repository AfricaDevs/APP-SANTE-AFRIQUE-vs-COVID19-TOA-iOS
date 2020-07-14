//
//  PreventionHandsView.swift
//  TOA
//
//  Created by Steven on 7/13/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI


struct PreventionHandsView: View { 
    
    @EnvironmentObject var settings: UserSettings
    @State private var selectedIndex = 0
    let bottomItems = [BottomBarItem(icon: "questionmark.square.dashed", title: NSLocalizedString("lWhy", comment: ""), color: .green),
                       
                       BottomBarItem(icon: "timer.square", title: NSLocalizedString("lWhen", comment: ""), color: .purple),
                       BottomBarItem(icon: "a.book.closed", title: NSLocalizedString("lHow", comment: ""), color: .blue)
    ]
    
    var body: some View {
        
        VStack {
            if self.selectedIndex == 0 {
                HandsWhyView()
            }
            if self.selectedIndex == 1 {
                HandsWhenView()
            }
            if self.selectedIndex == 2 {
                HandsHowView()
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

struct HandsWhyView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View{
        
        ScrollView{
            VStack {
                
                HStack{
                    Text("handsWhy")
                        .font(  self.settings.textSize ?   .body : .system(size: 20))
                    Spacer()
                }.padding(.bottom, 10)
                
                Spacer()
            }.padding()
            
        }
    }
}


struct HandsWhenView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    let preventionHandsWhenItems    = [
        PreventionHandsWhenItemModel(title: "preventionWhen1"), PreventionHandsWhenItemModel(title: "preventionWhen2"), PreventionHandsWhenItemModel(title: "preventionWhen3"), PreventionHandsWhenItemModel(title: "preventionWhen4"), PreventionHandsWhenItemModel(title: "preventionWhen5"),
        
        PreventionHandsWhenItemModel(title: "preventionWhen6"), PreventionHandsWhenItemModel(title: "preventionWhen7"), PreventionHandsWhenItemModel(title: "preventionWhen8"), PreventionHandsWhenItemModel(title: "preventionWhen9"), PreventionHandsWhenItemModel(title: "preventionWhen10"),
        
        PreventionHandsWhenItemModel(title: "preventionWhen11")
    ]
    
    var body: some View{
        
        List{
            ForEach(self.preventionHandsWhenItems){ prevention in
                HStack{
                    Image(systemName: "arrow.turn.down.right")
                    Text(NSLocalizedString(prevention.title, comment:""))
                        .font(  self.settings.textSize ?   .body : .system(size: 20))
                    Spacer()
                }
            }
            
            
        }
        
        
    }
}

struct HandsHowView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    let preventionHandsHowItems    =
        [PreventionHandsHowItemModel(title: "preventionHow1", imageName: "hands_how1"),
         PreventionHandsHowItemModel(title: "preventionHow2", imageName: "hands_how2"),
         PreventionHandsHowItemModel(title: "preventionHow3", imageName: "hands_how3"),
         PreventionHandsHowItemModel(title: "preventionHow4", imageName: "hands_how4"),
         PreventionHandsHowItemModel(title: "preventionHow5", imageName: "hands_how5"),
         PreventionHandsHowItemModel(title: "preventionHow6", imageName: "hands_how6")]
    
    var body: some View{
        
        List{
            ForEach(self.preventionHandsHowItems){ prevention in
                HStack{
                    Spacer()
                    VStack (alignment: .center, spacing: 0){
                        Image(prevention.imageName)
                        Text(NSLocalizedString(prevention.title, comment:""))
                            .font(  self.settings.textSize ?   .body : .system(size: 20))
                        
                    }
                    Spacer()
                }
            }
            
        }.padding()
        
        
    }
}

