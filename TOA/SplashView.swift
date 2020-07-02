//
//  SplashView.swift
//  TOA
//
//  Created by Steven on 7/2/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    
    @State var animateLogo = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
        VStack(alignment: .center){
            
            if !self.animateLogo {
                Spacer()
            }
            
            HStack{
                
                Spacer()
                Image("logo_round")
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(width:self.animateLogo ? 120 : 150, height: self.animateLogo ? 120 : 150)
                    .shadow(color: Color.white, radius: 5, x: 0, y: 1)
            Spacer()
            }
            .padding(EdgeInsets(top:  self.animateLogo ? geometry.safeAreaInsets.top + 70 : .zero, leading: .zero, bottom: geometry.safeAreaInsets.bottom + 70, trailing: .zero))
                 
                //very important to use GeometryReader to access safe arean values
               
               
            
            if self.animateLogo {
                Spacer()
            }
        
        }.background(Color("colorSplashBlue"))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            
           //DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               withAnimation {
                   self.animateLogo = true
            }
           //}
       }
        
            
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
