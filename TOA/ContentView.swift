//
//  ContentView.swift
//  TOA
//
//  Created by Steven on 6/26/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive = false
    @State var showCovidTestActionSheet: Bool = false
    @State var showMoreActionSheet: Bool = false
    @State var isDrawerOpen: Bool = false
    @State var showMoreOption: Int = 0
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text(""), message: Text("chooseOption"), buttons: [
            .default(Text("mainOoptionTeam"), action: {
                withAnimation {
                    self.showMoreOption = 0
                }
            }),
            .default(Text("mainOoptionCredits"), action: {
                
                self.showMoreOption = 2
            }),
            .destructive(Text("anuller"))
        ])
    }
    
    var body: some View {
            VStack {
                Spacer(minLength: 0)
                
                if self.isActive { 
                    MainView(showMoreActionSheet: self.$showMoreActionSheet)// selectedCountry: @Binding Country(name: "Steve", iso2: "cg", iso3: "cg"))
                } else {
                    
                    SplashView()
                }
            }.background(Color("colorWhiteBg"))
                .actionSheet(isPresented: self.$showMoreActionSheet, content: {                  self.actionSheet })
                .onAppear {
                    
                    //Wait for 2 minutes before loading the MainView
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
            }
        } 
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
