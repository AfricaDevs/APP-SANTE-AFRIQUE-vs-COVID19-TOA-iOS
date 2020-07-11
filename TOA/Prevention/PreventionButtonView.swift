//
//  PreventionButtonView.swift
//  TOA
//
//  Created by Steven on 7/11/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct PreventionButtonView: View {
    var body: some View {
        ZStack(alignment: .leading){
            
            Ellipse()
                .fill(Color("colorBtnGreen"))
                .frame(width: 120, height: 16)
                .rotationEffect(Angle.init(degrees: 343))
                .offset(x:-90,y:48)
            
            NavigationLink (destination: PreventionView()  ){
                
                HStack{
                    ZStack{
                        Ellipse()
                            .fill(Color("colorBtnGreen"))
                            .frame(width: 120, height: 16)
                            .rotationEffect(Angle.init(degrees: 325))
                            .offset(x:90,y:-45)
                            .padding(.top, 0)
                        
                        //Custom animated lottie JSON
                        LottieView(animationName: "covid_armor")
                            .aspectRatio(contentMode: ContentMode.fit)
                            .frame(width: 120, height: 100)
                            .padding(.all, 0).offset(x: -15, y: 0)
                    }
                    Spacer(minLength: 0)
                    
                    VStack{
                        
                        Spacer()
                        Text("mainPreventionButtonTitle")
                            .multilineTextAlignment(.center)
                            .font(.headline).foregroundColor(Color.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .background(Color("colorBtnGreen"))
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .background(Color("colorMainButtonsWhiteBackground"))
                    .cornerRadius(5)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                    
                    .shadow(color: Color("colorBtnMainShadow"), radius: 2, x: 0, y: 3)
            } //NavigationLink
            
        }
    }
}

struct PreventionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PreventionButtonView()
    }
}
