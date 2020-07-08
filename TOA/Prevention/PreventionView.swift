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
    let data = DataLoader(jsonFileName: "preventionOptionsArray")
    
    var body: some View {
         
        VStack{
          
            
            List{
                ForEach(data.preventionArray){ prevention in
                    
                    NavigationLink(destination:PreventionDetailControlerView(preventionItem: prevention, preventionOptionIndex: 2) /* Ambiguous Ternary to send the right Detail View */
                          
                    ){
                        HStack{
                            LottieView(animationName: prevention.getLottieFileName)
                                .aspectRatio(contentMode: ContentMode.fit)
                                .frame(width: 80, height: 60)
                                .padding(.all, 2)
                            
                            Text(prevention.getTitle)
                            
                            }.padding(.all, 5)
                    
                    }
                }
            }
        }.navigationBarTitle("preventionToolbarTitle", displayMode: .inline)
        .navigationBarItems(trailing: ToolbarItem())
       
        
    }
}

struct PreventionView_Previews: PreviewProvider {
    static var previews: some View {
        PreventionView()
    }
}
