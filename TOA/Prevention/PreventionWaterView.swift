//
//  PreventionWaterView.swift
//  TOA
//
//  Created by Steven on 7/14/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//



import SwiftUI


struct PreventionWaterView: View {
    
    @EnvironmentObject var settings: UserSettings
    @State private var selectedIndex = 0
    let bottomItems = [
        
        BottomBarItem(icon: "a.book.closed", title: NSLocalizedString("Eau de consommation", comment: ""), color: .blue),
        BottomBarItem(icon: "a.book.closed", title: NSLocalizedString("Eaux usées", comment: ""), color: .green)
    ]
    
    var body: some View {
        
        VStack {
            if self.selectedIndex == 0 {
                ConsumptionWaterView()
            }
            if self.selectedIndex == 1 {
                UsedWaterView()
            }
            
            Spacer()
            
            BottomBar(selectedIndex: $selectedIndex, items: bottomItems).padding(.horizontal, 10)
        }
        .navigationBarTitle("preventionHandsToolbarTitle", displayMode: .inline)
        .navigationBarItems(trailing: ToolbarItem().onTapGesture {
            self.settings.textSize.toggle()
            
            UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
        })
    }
}

struct ConsumptionWaterView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View{
        
        ScrollView{
            VStack(alignment: .leading){
                
                HStack{
                    Text("preventionConsumptionWater")
                        .font(  self.settings.textSize ?   .body : .system(size: 20))
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    
                    LottieView(animationName: "lottie_water" )
                        .frame(width:100, height:100)
                        .aspectRatio(contentMode: ContentMode.fit)
                }
                Spacer()
            }.padding()
            
        }
    }
}


struct UsedWaterView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View{
        
        ScrollView{
            VStack(alignment: .leading) {
                
                HStack{
                    Text("preventionUsedWater")
                        .font(  self.settings.textSize ?   .body : .system(size: 20))
                     
                }
                Spacer()
                HStack{
                    Spacer()
                    
                    LottieView(animationName: "lottie_water" )
                        .frame(width:100, height:100)
                        .aspectRatio(contentMode: ContentMode.fit)
                }

                Spacer()
            }.padding()
        
    
}
}
}


