//
//  DiagnosisDeceaseDetailView.swift
//  TOA
//
//  Created by Steven on 7/17/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisDeceaseDetailView: View {
    
    @Binding var showCovidTestActionSheet: Bool
    var selectedDisease : Disease
    
    @EnvironmentObject var settings: UserSettings
    
    var body : some View{
        VStack{
            
            DeceaseItemView(showCovidTestActionSheet: self.$showCovidTestActionSheet, selectedDisease: self.selectedDisease)
            
        }.navigationBarTitle("diagnosisTitle", displayMode: .inline)
            .navigationBarItems(trailing: ToolbarItem().onTapGesture {
                self.settings.textSize.toggle()
                
                UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
            }).padding(.all, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("colorBtnBlue"), lineWidth: 2)
                
        ).padding(.all, 5)
    }
}

struct DiagnosisDeceaseDetailView_Previews: PreviewProvider {
    @State static var showCovidTestActionSheet = false
    @State static var selectedDisease = Disease(id: 2, disease: "Hypertension Artérielle", detailTitle: "diseaseHypertensionTitle", detailBody: "diseaseHypertension")
    
    static var previews: some View {
        DiagnosisDeceaseDetailView(showCovidTestActionSheet: self.$showCovidTestActionSheet, selectedDisease: self.selectedDisease)
    }
}

struct DeceaseItemView: View{
    
    @Binding var showCovidTestActionSheet: Bool
    var selectedDisease: Disease
    
    @EnvironmentObject var settings: UserSettings
    
    
    var body : some View{
        VStack{
            ScrollView{
                VStack (alignment: .leading, spacing: 10){
                    HStack{
                        Text(NSLocalizedString(selectedDisease.detailTitle, comment:""))
                            .font( self.settings.textSize ? .system(size: 18) : .system(size: 21))
                            .fontWeight(.semibold)
                    }
                    
                    HStack{
                        Text(NSLocalizedString(selectedDisease.detailBody, comment:""))
                            .font(  self.settings.textSize ? .body : .system(size: 20))
                    }
                    
                    Spacer()
                } 
            }
            
            Spacer()
            
            NavigationLink(destination: PreventionView()){
                EmptyView()
            }
            
            Button(
                action: {
                    self.showCovidTestActionSheet = true
                    //ActionSheet Covid Test nagative or positive
            }){
                HStack {
                    Spacer()
                    Text("btnContinueAnalysis")
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
                ) .padding(10)
            }
            
        }
    }
}
