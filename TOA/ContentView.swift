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
    
    var body: some View {
            VStack {
                Spacer(minLength: 0)
                
                if self.isActive {
                    //SplashView()
                    MainView()
                } else {
                    
                    SplashView()
                }
            }.background(Color("colorMainWhiteBg"))
                
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
