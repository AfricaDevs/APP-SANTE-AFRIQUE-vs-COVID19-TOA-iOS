//
//  DiagnosisView.swift
//  TOA
//
//  Created by Steven on 7/16/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisView: View {
    
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
    
    func toggle(){isChecked = !isChecked
        self.showWarning = false
    }
    func toggle2(){isChecked2 = !isChecked2
        self.showWarning = false}
    func toggle3(){isChecked3 = !isChecked3
        self.showWarning = false}
    func toggle4(){isChecked4 = !isChecked4
        self.showWarning = false}
    func toggle5(){isChecked5 = !isChecked5
        self.showWarning = false}
    func toggle6(){isChecked6 = !isChecked6
        self.showWarning = false}
    func toggle7(){isChecked7 = !isChecked7
        self.showWarning = false}
    
    var body: some View {
        
        VStack{
            
            HStack{
                Text("diagnosisIntro")
                    .multilineTextAlignment(.leading)
                    .font( self.settings.textSize ? .system(size: 19) : .system(size: 21))
                    .padding(.all, 8)
                Spacer()
            }
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
                            Spacer()
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    
                    Button(action: toggle2){
                        HStack{
                            Image(systemName: isChecked2 ? "checkmark.square": "square")
                            Text("diagnosisSymptom3")
                            Spacer()
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    
                }
                
                HStack{
                    Button(action: toggle3){
                        HStack{
                            Image(systemName: isChecked3 ? "checkmark.square": "square")
                            Text("diagnosisSymptom2")
                            Spacer()
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    
                    Button(action: toggle4){
                        HStack{
                            Image(systemName: isChecked4 ? "checkmark.square": "square")
                            Text("diagnosisSymptom4")
                            Spacer()
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    
                }
                
                HStack{
                    Button(action: toggle5){
                        HStack{
                            Image(systemName: isChecked5 ? "checkmark.square": "square")
                            Text("diagnosisSymptom5")
                            Spacer()
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    
                    Button(action: toggle6){
                        HStack{
                            Image(systemName: isChecked6 ? "checkmark.square": "square")
                            Text("diagnosisSymptom6")
                            Spacer()
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    
                }
                Button(action: toggle7){
                    HStack{
                        Image(systemName: isChecked7 ? "checkmark.square": "square")
                        Text("diagnosisSymptom7")
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
                .padding(.bottom, 5)
                .opacity(showWarning ? 1 : 0)
            
            Button(action: {
                if self.isChecked || self.isChecked2 || self.isChecked3 || self.isChecked4 || self.isChecked5 || self.isChecked6  || self.isChecked7{
                    
                } else{
                    withAnimation{
                        self.showWarning = true
                    }
                }
            }) {
                HStack {
                    Text("btnNextSpaced")
                        
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .padding(.all, 10)
                        .background(Color("colorBtnBlue"))
                        .cornerRadius(30)
                        .foregroundColor(.white)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("colorBtnBlue"), lineWidth: 5)
                    )
                }
            }.padding(.bottom, 10)
            
            NavigationLink(destination: DiagnosisView()){
                
                HStack {
                    Text("btnNoSymptom")
                        
                        .fontWeight(.semibold)
                        .font(.system(size: 18))
                        .padding(.all, 10)
                        .background(Color("colorBtnGreen"))
                        .cornerRadius(30)
                        .foregroundColor(.white)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("colorBtnGreen"), lineWidth: 5)
                    )
                }.padding(.bottom, 10)
            }
            
        }.navigationBarTitle("diagnosisTitle", displayMode: .inline)
             .navigationBarItems(trailing: ToolbarItem().onTapGesture {
             self.settings.textSize.toggle()
             
             UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
             }).padding(.all, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("colorBtnBlue"), lineWidth: 2)
        )
            .padding(.all, 10)
        
        
    }
    
}

struct DiagnosisView_Previews: PreviewProvider {
    static var previews: some View {
        DiagnosisView()
    }
}


