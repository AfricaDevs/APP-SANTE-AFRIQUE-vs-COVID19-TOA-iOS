//
//  DiagnosisLastDepthView.swift
//  TOA
//
//  Created by Steven on 7/17/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisLastDepthView: View {
    
    @Binding var isShowing: Int //parent view controller
    @State var visibleSubView: Int = 1
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack{
            if self.visibleSubView == 1 {
                DepthOneView(isShowing: self.$isShowing, visibleSubView: self.$visibleSubView)
            } else if self.visibleSubView == 2 {
                DepthTwoView(isShowing: self.$isShowing, visibleSubView: self.$visibleSubView)
            } else if self.visibleSubView == 3 {
                DepthThreeView(isShowing: self.$isShowing, visibleSubView: self.$visibleSubView)
            }
        }
    }
}

struct DiagnosisLastDepthView_Previews: PreviewProvider {
    @State static var isShowing: Int = 2
    
    static var previews: some View {
        DiagnosisLastDepthView(isShowing: self.$isShowing)
    }
}

struct DepthOneView: View {
    
    @Binding var isShowing: Int
    @Binding var visibleSubView: Int
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        
            ScrollView{
                
                VStack {
                    VStack {
                        
                        HStack{
                            Spacer()
                            Text("diagnosisIntro2")
                                .multilineTextAlignment(.center)
                                .font( self.settings.textSize ? .system(size: 17) : .system(size: 20))
                                .padding(.all, 8)
                                .padding(.vertical, 15)
                            Spacer()
                        }
                        .background(Color("colorBookBackground"))
                        .cornerRadius(6)
                        
                        Text("diagnosisLastDepth1")
                            .multilineTextAlignment(.leading)
                            .font( .system(size:  self.settings.textSize ? 19 : 22))
                            .padding(.top, 10)
                    }
                    
                    
                    Spacer()
                    Button(action: {
                        withAnimation{
                            self.isShowing = 6 // RootView show RESULT Positive
                        }}){
                            
                            HStack {
                                Spacer()
                                Text("btnYesRespirationDifficulties")
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
                    }
                    
                    
                    Button(action: {
                        withAnimation{
                            self.visibleSubView = 2
                        }}){
                            
                            HStack {
                                Spacer()
                                Text("btnNoRespirationDifficulties")
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
                    }.padding(.top, 5)
                    
                }
            }
        
    }
}

struct DepthTwoView: View {
    
    @Binding var isShowing: Int
    @Binding var visibleSubView: Int
    
    
    @State var isChecked: Bool = false
    @State var isChecked2: Bool = false
    @State var isChecked3: Bool = false
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        
            ScrollView{
                VStack{
                    
                    Text("diagnosisIntro2")
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font( self.settings.textSize ?  .subheadline : .body)
                        
                        .padding(.all, 8)
                    
                    Text("diagnosisLastDepth2Question")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .font( self.settings.textSize ? .system(size: 19) : .system(size: 22))
                        .padding(.top, 4)
                    
                    Text("diagnosisCheckCases")
                        .multilineTextAlignment(.center)
                        .font( self.settings.textSize ? .subheadline : .body)
                        .padding(.all, 8)
                    
                }
                .background(Color("colorBookBackground"))
                .cornerRadius(6)
                
                Spacer()
                
                Button(action: {
                    self.isChecked.toggle()
                }){
                    HStack{
                        Image(systemName: self.isChecked ? "checkmark.square": "square")
                        Text("depthTwoOption1") .fontWeight(.semibold)
                            
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                }.frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.leading, 5)
                    .padding(.vertical, 5)
                
                
                Button(action: {
                    self.isChecked2.toggle()
                }){
                    HStack{
                        Image(systemName: self.isChecked2 ? "checkmark.square": "square")
                        Text("depthTwoOption2") .fontWeight(.semibold)
                            
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                }.frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.leading, 5)
                    .padding(.vertical, 5)
                
                
                Button(action: {
                    self.isChecked3.toggle()
                }){
                    HStack{
                        Image(systemName: self.isChecked3 ? "checkmark.square": "square")
                        Text("depthTwoOption3") .fontWeight(.semibold)
                            
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                }.frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.leading, 5)
                    .padding(.vertical, 5)
                
                Spacer()
                
                
                Spacer()
                Button(action: {
                    withAnimation{
                        self.isShowing = 6 // RootView show RESULT Positive
                    }}){
                        
                        HStack {
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
                }
                
                
                Button(action: {
                    withAnimation{
                        self.visibleSubView = 3
                    }}){
                        
                        HStack {
                            Spacer()
                            Text("diagnosisNoneSymptoms")
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
                }.padding(.top, 5)
                
                
                
            }
        }
    
}

struct DepthThreeView: View {
    
    @Binding var isShowing: Int
    @Binding var visibleSubView: Int
    
    @EnvironmentObject var settings: UserSettings 
    
    
    @State var isChecked:Bool = false
    @State var isChecked2:Bool = false
    @State var isChecked3:Bool = false
    @State var isChecked4:Bool = false
    @State var isChecked5:Bool = false
    @State var isChecked6:Bool = false
    @State var isChecked7:Bool = false
    @State var isChecked8:Bool = false
    
    @State var showWarning:Bool = false
    @State var checkedCount:Int = 0
    
    var body: some View {
        VStack{
            ScrollView{
                
                
                VStack{
                    /*
                    Text("diagnosisIntro2")
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font( self.settings.textSize ?  .subheadline : .body)
                        .padding(.all, 8)
                    */
                    
                    Text("diagnosisLastDepth3Question")
                        
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
                    
                    VStack(alignment: .center, spacing: 10){
                        
                        Button(action: toggle){
                            HStack{
                                Image(systemName: isChecked ? "checkmark.square": "square")
                                Text("diagnosisDepth3Symptom1")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        Button(action: toggle2){
                            HStack{
                                Image(systemName: isChecked2 ? "checkmark.square": "square")
                                Text("diagnosisDepth3Symptom3")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        Button(action: toggle3){
                            HStack{
                                Image(systemName: isChecked3 ? "checkmark.square": "square")
                                Text("diagnosisDepth3Symptom2")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        Button(action: toggle4){
                            HStack{
                                Image(systemName: isChecked4 ? "checkmark.square": "square")
                                Text("diagnosisDepth3Symptom4")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        Button(action: toggle5){
                            HStack{
                                Image(systemName: isChecked5 ? "checkmark.square": "square")
                                Text("diagnosisDepth3Symptom5")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        Button(action: toggle6){
                            HStack{
                                Image(systemName: isChecked6 ? "checkmark.square": "square")
                                Text("diagnosisDepth3Symptom6")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        
                        Button(action: toggle7){
                            HStack{
                                Image(systemName: isChecked7 ? "checkmark.square": "square")
                                Text("diagnosisDepth3Symptom7")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            
                        }
                        
                        Button(action: toggle8){
                            HStack{
                                Image(systemName: isChecked8 ? "checkmark.square": "square")
                                Text("diagnosisDepth3Symptom8")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                        }
                    }
                
             
                
                Spacer()
                    Text("diagnosisWarningCheck")
                        .multilineTextAlignment(.center)
                        .font( .subheadline)
                        .foregroundColor(Color.red)
                        .opacity(showWarning ? 1 : 0)
                    
                    Button(action: {
                        if self.checkedCount > 2 {
                            withAnimation{
                                self.isShowing = 6 // RootView show RESULT Positive
                            }
                        } else {
                            self.showWarning.toggle()
                        }
                        
                    }){  
                        HStack {
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
                    }
                    
                    
                    Button(action: {
                        withAnimation{
                            self.isShowing = 7  // RootView show RESULT Negative
                        }}){
                            
                            HStack {
                                Spacer()
                                Text("diagnosisNoneSymptoms")
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
                    }.padding(.top, 5)
        
        }
        }
    }
    
    
    func toggle(){
        if isChecked{
            checkedCount -= 1
        } else{
            checkedCount += 1
        }
        isChecked = !isChecked
        self.showWarning = false
    }
    func toggle2(){
        if isChecked{
            checkedCount -= 1
        } else{
            checkedCount += 1
        }
        isChecked2 = !isChecked2
        self.showWarning = false
    }
    func toggle3(){
        if isChecked{
            checkedCount -= 1
        } else{
            checkedCount += 1
        }
        isChecked3 = !isChecked3
        self.showWarning = false
    }
    func toggle4(){
        if isChecked{
            checkedCount -= 1
        } else{
            checkedCount += 1
        }
        isChecked4 = !isChecked4
        self.showWarning = false
    }
    func toggle5(){
        if isChecked{
            checkedCount -= 1
        } else{
            checkedCount += 1
        }
        isChecked5 = !isChecked5
        self.showWarning = false
    }
    func toggle6(){
        if isChecked{
            checkedCount -= 1
        } else{
            checkedCount += 1
        }
        isChecked6 = !isChecked6
        self.showWarning = false
    }
    func toggle7(){
        if isChecked{
            checkedCount -= 1
        } else{
            checkedCount += 1
        }
        isChecked7 = !isChecked7
        self.showWarning = false
    }
    func toggle8(){
        if isChecked{
            checkedCount -= 1
        } else{
            checkedCount += 1
        }
        isChecked8 = !isChecked8
        self.showWarning = false
    }
}

