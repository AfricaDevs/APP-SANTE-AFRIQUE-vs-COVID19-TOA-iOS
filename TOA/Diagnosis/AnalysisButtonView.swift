//
//  AnalysisButtonView.swift
//  TOA
//
//  Created by Steven on 7/11/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct AnalysisButtonView: View {
    var body: some View {
        
        ZStack(alignment: .leading){
            
            Ellipse()
                .fill(Color("colorBtnBlue"))
                .frame(width: 120, height: 16)
                .rotationEffect(Angle.init(degrees: 343))
                .offset(x:-90 ,y: 48)
            
            NavigationLink (destination: DiagnosisView()){
                
                HStack{
                    HStack{
                        ZStack{
                            Ellipse()
                                .fill(Color("colorBtnBlue"))
                                .frame(width: 120, height: 16)
                                .rotationEffect(Angle.init(degrees: 325))
                                .offset(x:90,y:-45)
                                .padding(.top, 0)
                            
                            LottieView(animationName: "covid_doctor").aspectRatio(contentMode: ContentMode.fit)
                                .frame(width: 90, height: 65) //this lottie view has no padding, we force it with the two frames : one on the view and the other on its direct parent
                        }
                    }.frame(width: 120, height: 100) //This size is equivalent to the previous lottieView frame
                    
                    Spacer(minLength: 0)
                    
                    VStack{
                        Spacer()
                        Text("mainAnalysisButtonTitle")
                            .multilineTextAlignment(.center)
                            .font(.headline).foregroundColor(Color.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .background(Color("colorBtnBlue"))
                    
                }.frame(minWidth: 0, maxWidth: (.infinity - CGFloat(30)), minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .background(Color("colorMainButtonsWhiteBackground"))
                    .cornerRadius(5)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                    .shadow(color: Color("colorBtnMainShadow"), radius: 2, x: 0, y: 3)
                
            }
            //NavigationLink
        }
    }
}

struct AnalysisButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisButtonView()
    }
}
