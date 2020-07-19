//
//  DiagnosisHomeView.swift
//  TOA
//
//  Created by Steven on 7/17/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisHomeView: View {
    
    @Binding var isShowing: Int
    @EnvironmentObject var settings: UserSettings
    
    //Checkboxes values
    @State var isChecked:Bool = false
    @State var isChecked2:Bool = false
    @State var isChecked3:Bool = false
    @State var isChecked4:Bool = false
    @State var isChecked5:Bool = false
    @State var isChecked6:Bool = false
    @State var isChecked7:Bool = false
    
    @State var showWarning:Bool = false
    
    func toggle(){
        isChecked = !isChecked
        self.showWarning = false
    }
    func toggle2(){
        isChecked2 = !isChecked2
        self.showWarning = false
    }
    func toggle3(){
        isChecked3 = !isChecked3
        self.showWarning = false
    }
    func toggle4(){
        isChecked4 = !isChecked4
        self.showWarning = false
    }
    func toggle5(){
        isChecked5 = !isChecked5
        self.showWarning = false
    }
    func toggle6(){
        isChecked6 = !isChecked6
        self.showWarning = false
    }
    func toggle7(){
        isChecked7 = !isChecked7
        self.showWarning = false
    }
    
    var body : some View{
        VStack{
            
            ScrollView{
                VStack{
                    
                    Text("diagnosisIntro")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .font( self.settings.textSize ? .system(size: 19) : .system(size: 22))
                        .padding(.top, 4)
                    
                    Text("diagnosisCheckCases")
                        .multilineTextAlignment(.center)
                        .font( self.settings.textSize ? .subheadline : .body)
                        .padding(.all, 8)
                    
                }.frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("colorBookBackground"))
                    .cornerRadius(6)
                
                Text("diagnosisIntro2")
                    .multilineTextAlignment(.center)
                    .font( self.settings.textSize ? .system(size: 16): .system(size: 19))
                    .padding(.top, 2)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 20){
                    HStack{
                        Button(action: toggle){
                            HStack{
                                Image(systemName: isChecked ? "checkmark.square": "square")
                                Text("diagnosisSymptom1")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        Button(action: toggle2){
                            HStack{
                                Image(systemName: isChecked2 ? "checkmark.square": "square")
                                Text("diagnosisSymptom3")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    
                    HStack{
                        Button(action: toggle3){
                            HStack{
                                Image(systemName: isChecked3 ? "checkmark.square": "square")
                                Text("diagnosisSymptom2")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        Button(action: toggle4){
                            HStack{
                                Image(systemName: isChecked4 ? "checkmark.square": "square")
                                Text("diagnosisSymptom4")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    
                    HStack{
                        Button(action: toggle5){
                            HStack{
                                Image(systemName: isChecked5 ? "checkmark.square": "square")
                                Text("diagnosisSymptom5")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        Button(action: toggle6){
                            HStack{
                                Image(systemName: isChecked6 ? "checkmark.square": "square")
                                Text("diagnosisSymptom6")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    Button(action: toggle7){
                        HStack{
                            Image(systemName: isChecked7 ? "checkmark.square": "square")
                            Text("diagnosisSymptom7")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        
                    }
                    
                }
            }
            Spacer()
            Text("diagnosisWarningCheck")
                .multilineTextAlignment(.center)
                .font( .subheadline)
                .foregroundColor(Color.red)
                .padding(.bottom, 5)
                .opacity(showWarning ? 1 : 0)
            
            //Navigation to MalariaView bound to self.$showingMalaria
            Button(action: {
                if self.isChecked || self.isChecked2 || self.isChecked3 || self.isChecked4 || self.isChecked5 || self.isChecked6  || self.isChecked7{
                    withAnimation{
                        self.isShowing = 2 //MalariaView
                    }
                } else{
                    withAnimation{
                        self.showWarning = true
                    }
                }
            }) { HStack {
                Spacer()
                Text("btnNextSpaced")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .padding(.all, 10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                Spacer()
            }.background(Color("colorBtnBlue"))
                .cornerRadius(30)
                .foregroundColor(.white)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("colorBtnBlue"), lineWidth: 5)
            ) .padding(5)
            }.padding(.bottom, 5)
            
            Button(action: {
                withAnimation{
                    self.isShowing = 3 //DiseasesView
                }
            }){ HStack {
                Spacer()
                Text("btnNoSymptom")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18))
                    .padding(.all, 10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                Spacer()
            }.background(Color("colorBtnGreen"))
                .cornerRadius(30)
                .foregroundColor(.white)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("colorBtnGreen"), lineWidth: 5)
            ) .padding(5)
            }
            
            
        }  
    }
}

struct DiagnosisHomeView_Previews: PreviewProvider {
    
    @State static var isShowing = 1
    static var previews: some View {
        DiagnosisHomeView(isShowing: self.$isShowing)
    }
}
