//
//  MainView.swift
//  TOA
//
//  Created by Steven on 7/2/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        
        GeometryReader { geometry in
            
            ScrollView(.vertical, showsIndicators: false){
                Spacer(minLength: 0)
                 
                    
                HStack{
                    
                    Spacer()
                    Image("logo_round")
                        .resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .shadow(color: Color.gray, radius: 5, x: 0, y: 1)
                    Spacer()
                }//geometry.safeAreaInsets.top +
                .padding(EdgeInsets(top:  70, leading: .zero, bottom: .zero, trailing: .zero))
                
                
              
                     
            }
             
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
