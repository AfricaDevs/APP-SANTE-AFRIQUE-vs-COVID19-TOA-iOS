//
//  MainView.swift
//  TOA
//
//  Created by Steven on 7/2/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI
import UIKit
import KenBurns


struct MainView: View {
    //let ken = KenBurnsImageView()
    let animatedViewHeight : CGFloat = 250
    @State private var scrollViewContentOffset = CGFloat(0)
    
    
    var body: some View {
        
        //localized textes
        GeometryReader { geometry in //{ outsideProxy in
            
            
            ZStack(alignment: .top){
                
                
                //This image in the back of the AnimatedView serves as a placeholder because the animage has an estimated 2 seconds delay to load
                Image("covid_worms_bg")
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.animatedViewHeight, alignment: .top)
                
                
                AnimatedView(imageName: "covid_worms_bg")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.animatedViewHeight, alignment: .top)
                
                HStack {
                    ZStack{
                        
                        //This and the next element are key overlays to keeps the animated with in harmony with the safeArea informations (time, battery
                        Color.black.opacity(0.5).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.animatedViewHeight, alignment: .top)
                        
                        ZStack{
                            LinearGradient(gradient: Gradient(colors:
                                [
                                    Color.gray.opacity(0.3),
                                    Color.black.opacity(0.1),
                                    Color.black.opacity(0.15),
                                    Color.black.opacity(0.2)
                                ]
                            ), startPoint: .top, endPoint: .bottom)
                            
                            RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.black.opacity(0.1)]), center: .trailing, startRadius: 10, endRadius: 140)//.padding(.top, 70)
                            
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.animatedViewHeight, alignment: .top)
                        
                        //The ternary here helps to avoid the animation from handling scroll-top Drag Events
                    }.offset(x:  self.scrollViewContentOffset > 0 ? 0 : self.scrollViewContentOffset, y: 0)
                    
                    
                    Spacer(minLength: 0)
                    
                    ZStack{
                        
                        //This and the next element are key overlays to keeps the animated with in harmony with the safeArea informations (time, battery
                        Color.black.opacity(0.5).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.animatedViewHeight, alignment: .top)
                        
                        ZStack{
                            LinearGradient(gradient: Gradient(colors:
                                [
                                    Color.gray.opacity(0.3),
                                    Color.black.opacity(0.1),
                                    Color.black.opacity(0.15),
                                    Color.black.opacity(0.2)
                                ]
                            ), startPoint: .top, endPoint: .bottom)
                            
                            RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.black.opacity(0.1)]), center: .leading, startRadius: 10, endRadius: 140)//.padding(.top, 70)
                            
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.animatedViewHeight, alignment: .top)
                        
                         //The ternary here helps to avoid the animation from handling scroll-top Drag Events
                    }.offset(x:  self.scrollViewContentOffset > 0 ? 0 : -self.scrollViewContentOffset, y: 0)
                    
                }
                VStack {
                    GeometryReader { outsideProxy in
                        TrackableScrollView(.vertical, contentOffset: self.$scrollViewContentOffset) {
                    //ScrollView(.vertical, showsIndicators: false){
                      
                        
                        VStack(alignment: .center, spacing: 0){
                             
                                // Send value to the parent
                                
                            HStack{
                                
                                Spacer()
                                
                                //App logo
                                Image("logo_round")
                                    .resizable().aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 120)
                                    .shadow(color: Color.white, radius: 3, x: 0, y: 3)
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top:  geometry.safeAreaInsets.top + 70, leading: .zero, bottom: 2, trailing: .zero))
                            
                            
                            
                            HStack{
                                Text("mainIntro")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.leading)
                                    .padding(.all, 8)
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                                .background(Color("colorBookBackground"))
                                .cornerRadius(6)
                                .padding(.horizontal, 15.9)
                            //.shadow(color: Color.gray, radius: 1, x: 0, y: 1)
                            
                            ZStack(alignment: .leading){
                                
                                Ellipse()
                                    .fill(Color("colorBtnGreen"))
                                    .frame(width: 120, height: 16)
                                    .rotationEffect(Angle.init(degrees: 343))
                                    .offset(x:-90,y:48)
                                
                                HStack{
                                    ZStack{
                                        Ellipse()
                                            .fill(Color("colorBtnGreen"))
                                            .frame(width: 120, height: 16)
                                            .rotationEffect(Angle.init(degrees: 325))
                                            .offset(x:90,y:-45)
                                            .padding(.top, 0)
                                        
                                        //Custom animated lottie JSON
                                        LottieView(animationName: "covid_armor").aspectRatio(contentMode: ContentMode.fit)
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
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                                    
                                    .shadow(color: Color.gray, radius: 2, x: 0, y: 3).onTapGesture {
                                        
                                } //The first button behavior
                                
                            } //ZStack (backgound Elipse & View)
                            
                            
                            ZStack(alignment: .leading){
                                
                                Ellipse()
                                    .fill(Color("colorBtnBlue"))
                                    .frame(width: 120, height: 16)
                                    .rotationEffect(Angle.init(degrees: 343))
                                    .offset(x:-90,y:48)
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
                                    
                                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                                    .shadow(color: Color.gray, radius: 2, x: 0, y: 3)
                                    .onTapGesture {
                                        
                                } //The second button behavior
                                
                                
                            } //ZStack (backgound Elipse & View)
                            
                            Text("mainAnalysisComment")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(EdgeInsets(top: 2, leading: 13, bottom: 5, trailing: 13))
                            //no padding is needed bewteen the last button and this text. The purpose is make them look like one
                             
                        }//VStack
                    }//Schrollview
                        
                    }//GeometryReader
                    
                    
                    
                    
                    HStack{
                        Spacer()
                        Text("credits")
                            .font(.footnote)
                        Spacer()
                          
                        Text("btnPrivacyPolicies")
                            .font(.footnote)
                        Spacer()
                        /*
                         HTMLView(htmlString: NSLocalizedString("privacyPoliciesHint", comment: ""))
                         .font(.footnote)
                         .background(Color("colorAppMainBackground"))
                         */
                    }
                    .padding(.all, 10)
                    
                    
                }//VStack
            }.edgesIgnoringSafeArea(.top)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
