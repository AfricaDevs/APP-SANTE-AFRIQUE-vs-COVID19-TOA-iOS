//
//  PreventionDeathsView.swift
//  TOA
//
//  Created by Steven on 7/7/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct PreventionDeathsView: View {
    var text: String = ""
    @State var textSize = true
    
    var body: some View {
        
        ScrollView{
        VStack {
             
            HStack{
                Text("preventionFuneralsTitle")
                    .font( textSize ? .system(size: 20): .system(size: 22))
                    .fontWeight(.bold)
                Spacer()
            }.padding(.bottom, 10)
            
            VStack{
            HStack{
                Text("CICR").padding(.bottom, 2)
                Text("preventionFuneralsCICRLink")
                    .foregroundColor(Color.blue)
                    .onTapGesture {
                        let urlComponents = URLComponents (string: NSLocalizedString("CICRWebsite", comment: "")) //Th website differs by language
                        UIApplication.shared.open ((urlComponents?.url!)!)
                }
                Spacer()
            }
            
            HStack{
                Text("preventionFuneralsBody1")//.font(.headline)
                Spacer()
            }
            HStack{
                Text("preventionFuneralsTitle2").font(.headline)
                Spacer()
            }.padding(.top, 10)
            
            HStack{
                Text("preventionFuneralsBody2")
                Spacer()
            }
            
            HStack{
                Text("preventionFuneralsTitle3").font(.headline)
                Spacer()
            }.padding(.top, 10)
            
            HStack{
                Text("preventionFuneralsBody3")
                Spacer()
            }
             
            }.font( textSize ? .body : .system(size: 20))
            
            Spacer()
            
        //preventionDeathsTitle
        }.padding()
            
        }.navigationBarTitle("preventionFuneralsToolbarTitle", displayMode: .inline)
            .navigationBarItems(trailing: ToolbarItem().onTapGesture {
                self.textSize.toggle()
            })
    }
}

struct PreventionDeathsView_Previews: PreviewProvider {
    static var previews: some View {
        PreventionDeathsView()
    }
}
