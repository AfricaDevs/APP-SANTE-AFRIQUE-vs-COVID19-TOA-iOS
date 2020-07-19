//
//  DiagnosisDeceaseView.swift
//  TOA
//
//  Created by Steven on 7/17/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisDeceaseView: View {
    
    @Binding var isShowing: Int
    @Binding var selectedDisease: Disease
    @Binding var showCovidTestActionSheet: Bool
    @EnvironmentObject var settings: UserSettings
    
    let diseases = [
        Disease(id: 1, disease: "Drépanocytose", detailTitle: "diseaseDrepanocytoseTitle", detailBody: "diseaseDrepanocytose"),
        Disease(id: 2, disease: "Hypertension Artérielle", detailTitle: "diseaseHypertensionTitle", detailBody: "diseaseHypertension"),
        Disease(id: 3, disease: "Maladies respiratoires chroniques", detailTitle: "diseaseRespirationTitle", detailBody: "diseaseRespiration"),
        Disease(id: 4, disease: "Thalassémie", detailTitle: "diseaseThalasemieTitle", detailBody: "diseaseThalasemie"),
        Disease(id: 5, disease: "Diabète", detailTitle: "diseaseDiabeteTitle", detailBody: "diseaseDiabete"),
        Disease(id: 6, disease: "Obésité", detailTitle: "diseaseObesiteTitle", detailBody: "diseaseObesite")
    ]
    
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
                    
                    //We return the @Binding properties that manage the view state and the info to pass to the detail view
                    Button(action: {
                        self.selectedDisease = disease
                        self.isShowing = 4 /// show DiagnosisDeceaseDetailView (detail view)
                    }){
                        HStack{
                            Text(disease.disease).padding(.vertical)
                            Spacer()
                        }
                    }
                    
                    /* use this in case you want ti implement a nagigation instead of having a unique navigation like is the App doing
                     
                     NavigationLink( destination: DiagnosisDeceaseDetailView(isShowing: self.$isShowing, disease: disease)){
                     HStack{
                     Text(disease.disease).padding(.vertical)
                     Spacer()
                     }
                     }
                     */
                }
            }
            Spacer()
            
            
            Button(
                action: {
                    self.showCovidTestActionSheet = true//ActionSheet Test results
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
            
        }
        
        
    }
}

struct DiagnosisDeceaseView_Previews: PreviewProvider {
    @State static var isShowing = 2
    @State static var selectedDisease = Disease(id: 2, disease: "Hypertension Artérielle", detailTitle: "", detailBody: "")
    @State static var showCovidTestActionSheet = false
    
    static var previews: some View {
        DiagnosisDeceaseView(isShowing: self.$isShowing, selectedDisease: self.$selectedDisease, showCovidTestActionSheet: self.$showCovidTestActionSheet)
    }
}

struct Disease: Identifiable {
    var id : Int
    var disease : String
    var detailTitle: String
    var detailBody: String
}
