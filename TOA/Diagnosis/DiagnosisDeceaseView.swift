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
    
    let deceases = [
        Decease(id: 1, decease: "Drépanocytose"),
        Decease(id: 2, decease: "Hypertension Artérielle"),
        Decease(id: 3, decease: "Maladies respiratoires chroniques"),
        Decease(id: 4, decease: "Thalassémie"),
        Decease(id: 5, decease: "Diabète"),
        Decease(id: 6, decease: "Obésité")
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
                ForEach(self.deceases){ decease in
                    NavigationLink( destination: DiagnosisDeceaseDetailView(decease: decease)){
                        
                        HStack{
                            Text(decease.decease).padding(.vertical)
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
                    Text("btnDiagnosisDeceaseNone")
                        
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
                }.padding(.vertical, 10)
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
    var decease : String
}
