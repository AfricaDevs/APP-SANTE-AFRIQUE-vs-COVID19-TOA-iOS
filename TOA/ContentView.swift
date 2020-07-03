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
        // 2.
        if self.isActive {
            // 3.
            MainView()
        } else {
            // 4.
            
            //Text("splashhh")
            SplashView()
        }
        }.background(Color("colorMainWhiteBg"))
    // 5.
    .onAppear {
        // 6.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // 7.
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
