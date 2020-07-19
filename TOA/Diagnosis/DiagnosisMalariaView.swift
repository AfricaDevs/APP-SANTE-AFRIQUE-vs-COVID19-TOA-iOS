//
//  DiagnosisMalariaView.swift
//  TOA
//
//  Created by Steven on 7/17/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisMalariaView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @Binding var isShowing: Int
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("diagnosisMalariaTitle")
                    .multilineTextAlignment(.center)
                    .font( self.settings.textSize ? .system(size: 19) : .system(size: 21))
                    .padding(.all, 8)
                    .padding(.vertical, 15)
                Spacer()
            }
            .background(Color("colorBookBackground"))
            .cornerRadius(6)
            
            Text("diagnosisMalaria")
                .multilineTextAlignment(.leading)
                .font( self.settings.textSize ? .body : .system(size: 19))
                .padding(.top, 10)
            
            Spacer()
            
            Button(action: {
                withAnimation{
                    self.isShowing = 3 //
                }}){
                    
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

struct DiagnosisMalariaView_Previews: PreviewProvider {
    
    @State static var isShowing = 2;
    static var previews: some View {
        DiagnosisMalariaView(isShowing: self.$isShowing)
    }
}
