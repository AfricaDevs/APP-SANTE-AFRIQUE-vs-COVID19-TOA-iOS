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
    let preventionOptions =
    [
        Prevention(id: 1,title:"preventionOption1",lottieFileName:"lottie_covid_hands"),
            Prevention(id:2,title:"preventionOption2",lottieFileName:"lottie_covid_mask"),
           Prevention(id:3,title:"preventionOption3",lottieFileName:"lottie_social_distancing"),
            Prevention(id:4,title:"preventionOption4",lottieFileName:"covid_doctor"),
           Prevention(id:5,title:"preventionOption5",lottieFileName:"lottie_water"),
           Prevention(id:6,title:"preventionOption6",lottieFileName:"lottie_trash_clean"),
           Prevention(id:7,title:"preventionOption7",lottieFileName:"lottie_sad")
    ]
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
         
        VStack{
          
            
            List{
                ForEach(preventionOptions){ prevention in
                    
                    NavigationLink(destination:PreventionDetailControlerView(preventionItem: prevention, preventionOptionIndex: 2) /* Ambiguous Ternary to send the right Detail View */
                          
                    ){
                        HStack{
                            LottieView(animationName: prevention.getLottieFileName)
                                .aspectRatio(contentMode: ContentMode.fit)
                                .frame(width: 80, height: 60)
                                .padding(.all, 2)
                            
                            Text(NSLocalizedString(prevention.getTitle, comment: "")).font(self.settings.textSize ? .body :  .system(size: 19))
                            
                            }.padding(.all, 5)
                    
                    }
                }
            }
        }.navigationBarTitle("preventionToolbarTitleShort", displayMode: .inline)
        .navigationBarItems(trailing: ToolbarItem().onTapGesture {
            self.settings.textSize.toggle()
            
            UserDefaults.standard.set(self.settings.textSize, forKey: "textSize")
        })
       
        
    }
}

struct PreventionView_Previews: PreviewProvider {
    static var previews: some View {
        PreventionView()
    }
}
