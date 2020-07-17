//
//  DiagnosisDeceaseDetailView.swift
//  TOA
//
//  Created by Steven on 7/17/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisDeceaseDetailView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var disease : Decease
    
    var body : some View{
        VStack{
            if self.disease.id == 1 {
                DeceaseItemView(title: "diseaseDrepanocytoseTitle", details: "diseaseDrepanocytose")
            } else if self.disease.id == 2 {
                DeceaseItemView(title: "diseaseHypertensionTitle", details: "diseaseHypertension")
            } else if self.disease.id == 3 {
                DeceaseItemView(title: "diseaseRespirationTitle", details: "diseaseRespiration")
            } else if self.disease.id == 4 {
                DeceaseItemView(title: "diseaseThalasemieTitle", details: "diseaseThalasemie")
            } else if self.disease.id == 5 {
                DeceaseItemView(title: "diseaseDiabeteTitle", details: "diseaseDiabete")
            } else {
                DeceaseItemView(title: "diseaseObesiteTitle", details: "diseaseObesite")
            }
            
            
        }.navigationBarTitle("diagnosisTitle", displayMode: .inline)
            .navigationBarItems(trailing: ToolbarItem().onTapGesture {
                self.settings.textSize.toggle()
                
                UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
            }).padding(.all, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("colorBtnBlue"), lineWidth: 2)
                
        ).padding(.all, 10)
    }
}

struct DiagnosisDeceaseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiagnosisDeceaseDetailView(disease: Decease(id: 1, disease: "Diabète"))
    }
}

struct DeceaseItemView: View{
    
    var title: String
    var details: String
    
    @EnvironmentObject var settings: UserSettings
    @State var showCovidTestActionSheet: Bool = false
    
    
    func actionYes() -> Void {
        
    }
    
    let testActionYes = TapGesture()
    .onEnded { _ in
        
    }
    let testYesView = Text("testOptionYes")//.gesture(testActionYes)
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("diagnosisTestActionSheet"), message: Text("chooseOption"), buttons: [
            .default(
                Text("testOptionYes")),
            .default(Text("testOptionNo"), action: self.actionYes),
            .destructive(Text("anuller"))
        ])
    }
    var body : some View{
        VStack{
            ScrollView{
                VStack (alignment: .leading, spacing: 10){
                    HStack{
                        Text(NSLocalizedString(title, comment:""))
                            .font( self.settings.textSize ? .system(size: 20) : .system(size: 22))
                            .fontWeight(.semibold)
                    }
                    
                    HStack{
                        Text(NSLocalizedString(details, comment:""))
                            .font(  self.settings.textSize ? .body : .system(size: 20))
                    }
                    
                    Spacer()
                    
                }.actionSheet(isPresented: self.$showCovidTestActionSheet, content: {                  self.actionSheet })
            }
            
            Spacer()
            
            NavigationLink(destination: PreventionView()){
                EmptyView()
            }
            
            Button(
                action: {
                    self.showCovidTestActionSheet.toggle()
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
                ) .padding(5)
            }
            
        }
    }
}
