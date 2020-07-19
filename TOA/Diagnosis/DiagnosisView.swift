//
//  DiagnosisView.swift
//  TOA
//
//  Created by Steven on 7/16/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisView: View {
    
    //1-Main, 2-Malaria, 3-Diseases, 4-DiseaseDetail, 5- , 6-
    @State var isShowing: Int = 1
    @State var showCovidTestActionSheet: Bool = false
    @State var selectedDisease = Disease(id: 2, disease: "Hypertension Artérielle", detailTitle: "diseaseHypertensionTitle", detailBody: "diseaseHypertension")
    
    @EnvironmentObject var settings: UserSettings
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("diagnosisTestActionSheet"), message: Text("chooseOption"), buttons: [
            .default(Text("testOptionYes"), action: {
                self.isShowing = 6
            }),
            .default(Text("testOptionNo"), action: {
                self.isShowing = 5
            }),
            .destructive(Text("anuller"))
        ])
    }
    
    
    var body: some View {
        
        VStack{
            if self.isShowing == 1{ //Home view
                DiagnosisHomeView(isShowing: self.$isShowing)
                
            } else if self.isShowing == 2{ //2-Malaria
                DiagnosisMalariaView(isShowing: self.$isShowing)
                
            } else if self.isShowing == 3{ // 3-Diseases
                DiagnosisDeceaseView(isShowing: self.$isShowing, selectedDisease: self.$selectedDisease, showCovidTestActionSheet: self.$showCovidTestActionSheet)
                
            } else if self.isShowing == 4{ //4-Disease Detail
                DiagnosisDeceaseDetailView(showCovidTestActionSheet: self.$showCovidTestActionSheet, selectedDisease: self.selectedDisease)
                
            } else if self.isShowing == 5{ //5-DiagnosisLastDepth
                DiagnosisLastDepthView(isShowing:  self.$isShowing)
                
            } else if self.isShowing == 6{ //6-RESULTS Positive
                ResultPositiveView(isShowing:  self.$isShowing)
                
            } else if self.isShowing == 7{ //7-RESULTS NEGATIVE
                ResultNegativeView(isShowing:  self.$isShowing)
                
            } else if self.isShowing == 8{ // EXIT THE DIAGNOSIS
                //exit
                
            }
        }.actionSheet(isPresented: self.$showCovidTestActionSheet, content: {                  self.actionSheet })
            
            .navigationBarTitle("diagnosisTitle", displayMode: .inline)
            .navigationBarItems(trailing: ToolbarItem().onTapGesture {
                self.settings.textSize.toggle()
                
                UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
            }).padding(.all, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("colorBtnBlue"), lineWidth: 2))
            .padding(.all, 10)
         
    }
    
}

struct DiagnosisView_Previews: PreviewProvider {
    @State static var isShowing: Int = 1
    @State static var showCovidTestActionSheet: Bool = false
    @State static var selectedDisease = Disease(id: 2, disease: "Hypertension Artérielle", detailTitle: "diseaseHypertensionTitle", detailBody: "diseaseHypertension")
    
    static var previews: some View {
        DiagnosisView(isShowing: self.isShowing, showCovidTestActionSheet: self.showCovidTestActionSheet, selectedDisease: self.selectedDisease )
    }
}


