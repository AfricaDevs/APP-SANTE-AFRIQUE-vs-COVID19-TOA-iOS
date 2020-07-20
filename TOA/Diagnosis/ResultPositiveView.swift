//
//  ResultPositiveView.swift
//  TOA
//
//  Created by Steven on 7/18/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct ResultPositiveView: View {
    @Binding var isShowing: Int //parent view controller
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                
                VStack (alignment: .leading, spacing: 0){
                    Image("covid_worms_bg")
                        .resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                    
                    Image("covid_worms_bg")
                        .resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                } 
                
                VStack (alignment: .leading, spacing: 0){
                    AnimatedView(imageName: "covid_worms_bg")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                    
                    AnimatedView(imageName: "covid_worms_bg")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                }
                 
                Color.black.opacity(0.7).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: geometry.size.height, alignment: .top)
                
                
                VStack(alignment: .center, spacing: 10){
                     
                Text("resultPositive")
                    
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: self.settings.textSize ? 17 : 20))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.all, 8)
                    .padding(.vertical, 5)
                    .background(Color.red.opacity(0.6))
                    .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(10)
                .padding(.all, 8)
                        
                    Text("resultProtection")
                        .foregroundColor(Color.gray)
                        .font( self.settings.textSize ? .body : .system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding(.all, 8)
                    
                    HStack(alignment: .center, spacing: 20){
                        LottieView(animationName: "lottie_covid_mask" )
                            .aspectRatio(contentMode: ContentMode.fit)
                            .frame(minWidth: 0, maxWidth: 90)
                        
                        LottieView(animationName: "lottie_covid_hands") .aspectRatio(contentMode: ContentMode.fit)
                            .frame(minWidth: 0, maxWidth: 90)
                        
                        
                        LottieView(animationName: "lottie_social_distancing") .aspectRatio(contentMode: ContentMode.fit)
                            .frame(minWidth: 0, maxWidth: 90)
                    }.frame(minWidth: 0, maxWidth: .infinity)//.background(Color("colorWhiteBg"))
                }
                 
                
            }.cornerRadius(6)
        }
    }
}

struct ResultPositiveView_Previews: PreviewProvider {
    @State static var isShowing: Int = 6
    
    static var previews: some View {
        ResultPositiveView(isShowing: self.$isShowing)
    }
}
