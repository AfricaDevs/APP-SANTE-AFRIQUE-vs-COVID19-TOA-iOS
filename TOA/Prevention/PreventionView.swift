//
//  PreventionView.swift
//  TOA
//
//  Created by Steven on 7/5/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI
import CoreLocation

struct PreventionView: View {
    let data = DataLoader()
    let iterator : Int = .zero
    
    var body: some View {
        NavigationView{
            
            List{
                ForEach(data.preventionArray){ prevention in
                    
                    HStack{
                        LottieView(animationName: prevention.getLottieFileName)
                            .frame(width: 80, height: 60)
                            .padding(.all, 2)
                        
                        Text(prevention.getTitle)
                        
                    }.padding(.all, 5)
                }
                 
            }.navigationBarTitle("preventionToolbarTitle")
        }
    }
    
}

struct PreventionView_Previews: PreviewProvider {
    static var previews: some View {
        PreventionView()
    }
}
