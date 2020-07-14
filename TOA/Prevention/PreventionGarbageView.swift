//
//  PreventionGarbageView.swift
//  TOA
//
//  Created by Steven on 7/14/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct PreventionGarbageView : View{
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        
        ScrollView{
            VStack{
                
                HStack{
                    
                    Image("garbage_gants")
                        .resizable().frame(width:60, height:60).aspectRatio(contentMode: ContentMode.fit)
                    
                    Image("garbage_top").resizable().aspectRatio(contentMode: ContentMode.fit)
                    
                    LottieView(animationName: "lottie_covid_hands" ).frame(width:60, height:60).aspectRatio(contentMode: ContentMode.fit)
                }
                    Text("preventionGarbage1")
                        .font(  self.settings.textSize ?  .system(size: 19): .system(size: 22))
                    
                HStack{
                    Text("preventionGarbage2")
                        .font(  self.settings.textSize ?  .system(size: 19): .system(size: 22))
                    Spacer()
                    Image("garbage_last")
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fit)
                        .frame(width: 70, height: 90)
                }
                
                Spacer()
            }.padding()
            
        }.navigationBarTitle("preventionGarbageToolbarTitle", displayMode: .inline)
            .navigationBarItems(trailing: ToolbarItem().onTapGesture {
                self.settings.textSize.toggle()
                
                UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
            })
    }
}
