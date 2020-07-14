//
//  PreventionMaskView.swift
//  TOA
//
//  Created by Steven on 7/14/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI


struct PreventionMaskView: View {
    
    @EnvironmentObject var settings: UserSettings
    @State private var selectedIndex = 0
    
    let bottomItems = [BottomBarItem(icon: "questionmark.square.dashed", title: NSLocalizedString("lWhy", comment: ""), color: .green),
                       
                       BottomBarItem(icon: "timer.square", title: NSLocalizedString("lWhen", comment: ""), color: .purple),
                       BottomBarItem(icon: "a.book.closed", title: NSLocalizedString("lHow", comment: ""), color: .blue)
    ]
    
    var body: some View {
        
        VStack {
            if self.selectedIndex == 0 {
                MaskWhyView()
            }
            if self.selectedIndex == 1 {
                MaskWhenView()
            }
            if self.selectedIndex == 2 {
                MaskHowView()
            }
            
            Spacer()
            
            BottomBar(selectedIndex: $selectedIndex, items: bottomItems)
        }
        .navigationBarTitle("preventionMaskToolbarTitle", displayMode: .inline)
        .navigationBarItems(trailing: ToolbarItem().onTapGesture {
            self.settings.textSize.toggle()
            
            UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
        })
    }
}

struct MaskWhyView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View{
        
        ScrollView{
            VStack {
                
                HStack{
                    Text("preventionMaskWhy")
                        .font(  self.settings.textSize ?  .system(size: 20): .system(size: 23))
                    Spacer()
                }.padding(.bottom, 20)
                
                
                Image("mask_first").resizable().aspectRatio(contentMode: ContentMode.fit)
                Spacer()
            }.padding()
            
        }
    }
}

    
    
struct MaskWhenView: View {
        
    @EnvironmentObject var settings: UserSettings
    
    var body: some View{
         
        
        ScrollView{
            VStack {
                
                HStack{
                    Text("preventionMaskWhen")
                        .font(  self.settings.textSize ?   .system(size: 20): .system(size: 23))
                    Spacer()
                }.padding(.bottom, 10)
                 
                HStack{
                    Image("mask_when_1")

                    Image("mask_when_2")
                }
                
                Image("mask_when_3")
            
                Spacer()
            }.padding()
            
        }
            
        
    }
}

struct MaskHowView: View {

     @EnvironmentObject var settings: UserSettings
    
    var body: some View{


        ScrollView{
            VStack {
                
                HStack{
                    Text("preventionMaskHow1")
                        .font(  self.settings.textSize ?   .body : .system(size: 20))
                    Spacer()
                }.padding(.bottom, 10)
                
                

                HStack{
                    LottieView(animationName: "lottie_covid_hands").frame(width: 150, height: 150)
                    
                    LottieView(animationName: "lottie_covid_mask").frame(width: 150, height: 150)
                }

               HStack{
                   Text("preventionMaskHow2")
                       .font(  self.settings.textSize ?   .system(size: 20) : .system(size: 23))
                   Spacer()
               }.padding(.bottom, 10)
                
                Spacer()
            }.padding()
            
        }
            
    }
}
