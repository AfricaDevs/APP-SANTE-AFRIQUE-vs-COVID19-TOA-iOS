//
//  MainView.swift
//  TOA
//
//  Created by Steven on 7/2/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//
import Foundation
import SwiftUI
import UIKit
import KenBurns
import Alamofire


struct MainView: View {
    
    let animatedViewHeight : CGFloat = 280
    
    @State private var scrollViewContentOffset = CGFloat(0)
    
    @State private var buttonOnTapAnimationStatus = false
     
    let isNavigationBarHidden: Bool = true
    
    var data  = DataLoader(jsonFileName: "countries_list")
      
     //@State var array : Array<Int> = [0,1,2]
    @State var selection : Country = Country(id: 0, name: "Congo (Brazzaville)", iso2: "cg", iso3: "cg") //nit country to Congo
    
    @State var mathdroApiCountryResult : CountryCases = CountryCases(confirmed: CasesSubItem(value: 0), recovered: CasesSubItem(value: 0), deaths: CasesSubItem(value: 0)){
        didSet{
            loadCovidData()
        }
    }
     
    var body: some View {

        GeometryReader { geometry in //{ outsideProxy in


            NavigationView{

                //localized textes

                ZStack(alignment: .topLeading){
                    
                    //This image in the back of the AnimatedView serves as a placeholder because the animage has an estimated 2 seconds delay to load
                    Image("covid_worms_bg")
                    .resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:   self.animatedViewHeight , alignment: .top)
                     
                    
                    AnimatedView(imageName: "covid_worms_bg")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.animatedViewHeight, alignment: .top)
                    
                    HStack {
                        ZStack{
                            
                            //This and the next element are key overlays to keeps the animated with in harmony with the safeArea informations (time, battery)
                            Color.black.opacity(0.5).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.animatedViewHeight, alignment: .top)
                            
                            ZStack{
                                LinearGradient(gradient: Gradient(colors:
                                    [
                                        Color("colorLinearGradient1").opacity(0.3),//Color.gray.opacity(0.3),
                                        Color("colorLinearGradient2").opacity(0.1),
                                        Color("colorLinearGradient3").opacity(0.15),
                                        Color("colorLinearGradient4").opacity(0.3)
                                    ]
                                ), startPoint: .top, endPoint: .bottom)
                                
                                RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.black.opacity(0.1)]), center: .trailing, startRadius: 10, endRadius: 120)//.padding(.top, 70)
                                
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
                                        Color("colorLinearGradient1").opacity(0.3),//Color.gray.opacity(0.3),
                                        Color("colorLinearGradient2").opacity(0.1),
                                        Color("colorLinearGradient3").opacity(0.15),
                                        Color("colorLinearGradient4").opacity(0.3)
                                    ]
                                ), startPoint: .top, endPoint: .bottom)
                                
                                RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.black.opacity(0.1)]), center: .leading, startRadius: 10, endRadius: 120)//.padding(.top, 70)
                                
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: self.animatedViewHeight, alignment: .top)
                            
                            //The ternary here helps to avoid the animation from handling scroll-top Drag Events
                        }.offset(x:  self.scrollViewContentOffset > 0 ? 0 : -self.scrollViewContentOffset, y: 0)
                        
                    }
                    
                    
                    VStack {
                        TrackableScrollView(.vertical, contentOffset: self.$scrollViewContentOffset) {
                            //ScrollView(.vertical, showsIndicators: false){
                            
                            VStack(alignment: .center, spacing: 0){
                                ZStack{
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 6) {
                                            
                                            Image(self.selection.iso2.lowercased())
                                                .aspectRatio(contentMode: ContentMode.fit)
                                            
                                            VStack(alignment: .leading, spacing: 1){ Text("Confirmés"); Text("\(self.mathdroApiCountryResult.confirmed.value)").foregroundColor(Color.yellow) }
                                            
                                            VStack(alignment: .leading, spacing: 1){ Text("Guéris"); Text("\(self.mathdroApiCountryResult.recovered.value)").foregroundColor(Color.yellow) }
                                            
                                            VStack(alignment: .leading, spacing: 1){ Text("Décès"); Text("\(self.mathdroApiCountryResult.deaths.value)").foregroundColor(Color.yellow) }
                                            
                                        }.foregroundColor(Color.white)
                                            .font(.subheadline)
                                            .offset(x: 0, y: self.scrollViewContentOffset < 0 ? self.scrollViewContentOffset: 0 )
                                            .animation(.easeOut)
                                        Spacer()
                                         
                                        Picker(selection: self.$selection, label: Text("")) {
                                            //ForEach( Array(self.data.countriesArray.enumerated()), id: \.1.id) {
                                            //ForEach( self.array, id : \.self ) { country in
                                            ForEach( self.data.countriesArray, id : \.self ) { country in
                                                //self.selectedCountry = country
                                                 
                                                Text(" \(country.name)").font(.subheadline).foregroundColor(Color.white).tag(country)
                                                
                                            }
                                            
                                        }.frame(width: 120, height: 100)
                                        .opacity(self.scrollViewContentOffset < -50 ? 0.0 : 1.0)
                                         .animation(.easeInOut)
                                        
                                        
                                    }//.background(Color("colorBookBackground"))
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                                        
                                   
                                    
                                HStack{
                                    //App logo
                                    Image("logo_round")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                          
                                        .shadow(color: Color.white, radius: 3, x: 0, y: 3)
                                        
                                     
                                }.padding(EdgeInsets(top:  /* status bar heigh - safeArea top padding defined in the parent view*/   80  , leading: .zero, bottom: 2, trailing: .zero))
                                 
                                } .padding(EdgeInsets(top: geometry.safeAreaInsets.top + 10, leading: 10, bottom: 10, trailing: 10))
                                 
                                
                                
                                   HStack{
                                       Text("mainIntro")
                                           .font(.subheadline)
                                           .multilineTextAlignment(.leading)
                                           .padding(.all, 8)
                                   }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                                       .background(Color("colorBookBackground"))
                                       .cornerRadius(6)
                                       .padding(.horizontal, 15.9)
                                
                                
                                PreventionButtonView() //ZStack - The first button (Prevention)
                                
                                AnalysisButtonView() //ZStack The second button (Analysis)
                                
                                
                                Text("mainAnalysisComment")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .padding(EdgeInsets(top: 4, leading: 13, bottom: 20, trailing: 13))
                                //no padding is needed bewteen the last button and this text. The purpose is make them look like one
                                
                                     
                            }//VStack
                            
                        }//Schrollview
                        
                        
                        HStack{
                            Spacer()
                            Text("credits")
                                .font(.footnote)
                            Spacer()
                            
                            Text("btnPrivacyPolicies")
                                .font(.footnote)
                            Spacer()
                        }
                        .padding(.all, 10)
                        
                        
                    }//VStack
                }.navigationBarTitle("Nav").navigationBarHidden(self.isNavigationBarHidden).edgesIgnoringSafeArea( self.isNavigationBarHidden ? .top : .top)
                    .onAppear(perform: self.loadCovidData)
                
                        //self.isNavigationBarHidden = true
                        //self.edgesIgnoringSafeArea(.top)
            }//NavigationView
            //.navigationBarHidden(true)
        }
        
    }
    

    func loadCovidData() {
        let countryName = self.selection.name.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        do {
            try  AF.request("https://covid19.mathdro.id/api/countries/\(countryName)").responseDecodable(of: CountryCases.self) { response in
            
            self.mathdroApiCountryResult = response.value ?? CountryCases(confirmed: CasesSubItem(value: 0), recovered: CasesSubItem(value: 0), deaths: CasesSubItem(value: 0))
            
            debugPrint("Response: \(response)")
        }
        } catch {
            
        }
         
        //AF.request("URL").response { response in }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
         
         MainView( )
    }
}

struct AnalysisButtonView: View {
    
    var body: some View {
        
        ZStack(alignment: .leading){
            
            Ellipse()
                .fill(Color("colorBtnBlue"))
                .frame(width: 120, height: 16)
                .rotationEffect(Angle.init(degrees: 343))
                .offset(x:-90 ,y: 48)
            
            NavigationLink (destination: PreventionView()){
                
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
