//
//  DiagnosisDeceaseView.swift
//  TOA
//
//  Created by Steven on 7/17/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisDeceaseView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @State var showCovidTestActionSheet: Bool = false
    
    func testNo()-> Void{
        
    }
    
    let diseases = [
        Decease(id: 1, disease: "Drépanocytose"),
        Decease(id: 2, disease: "Hypertension Artérielle"),
        Decease(id: 3, disease: "Maladies respiratoires chroniques"),
        Decease(id: 4, disease: "Thalassémie"),
        Decease(id: 5, disease: "Diabète"),
        Decease(id: 6, disease: "Obésité")
    ]
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("diagnosisTestActionSheet"), message: Text("chooseOption"), buttons: [
            .default(Text("testOptionYes")),
            .default(Text("testOptionNo"), action: testNo),
            .destructive(Text("anuller"))
        ])
    }

    
    var body: some View {
        
        VStack {
            HStack{
                Text("diagnosisDeceasesQuestion")
                    .multilineTextAlignment(.center)
                    .font( self.settings.textSize ? .system(size: 19) : .system(size: 21))
                    .padding(.all, 8)
                Spacer()
            }
            .background(Color("colorBookBackground"))
            .cornerRadius(6)
            
            Text("diagnosisDeceasesQuestionMore")
                .multilineTextAlignment(.center)
                .font( self.settings.textSize ? .system(size: 16): .system(size: 19))
                .padding(.top, 2)
            
            Spacer()
            List{
                ForEach(self.diseases){ disease in
                    NavigationLink( destination: DiagnosisDeceaseDetailView(disease: disease)){
                        
                        HStack{
                            Text(disease.disease).padding(.vertical)
                            Spacer()
                        }
                        
                    }
                }
            }
            Spacer()
            
            
            Button(
                action: {
               self.showCovidTestActionSheet.toggle()
            }){ 
                
                HStack {
                    Spacer()
                    Text("btnDiagnosisDeceaseNone")
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
            
        }.navigationBarTitle("diagnosisTitle", displayMode: .inline)
            .navigationBarItems(trailing: ToolbarItem().onTapGesture {
                self.settings.textSize.toggle()
                
                UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
            }).padding(.all, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color("colorBtnBlue"), lineWidth: 2)
        
        ).padding(.all, 10)
            .actionSheet(isPresented: self.$showCovidTestActionSheet, content: {                  self.actionSheet })
        
    }
}

struct DiagnosisDeceaseView_Previews: PreviewProvider {
    static var previews: some View {
        DiagnosisDeceaseView()
    }
}

struct Decease: Identifiable {
    var id : Int
    var disease : String
}
