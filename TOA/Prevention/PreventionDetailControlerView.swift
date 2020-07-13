//
//  PreventionDetailControlerView.swift
//  TOA
//
//  Created by Steven on 7/5/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct PreventionDetailControlerView: View {
    var preventionItem : Prevention
    var preventionOptionIndex : Int
    
    var body: some View {
        
        VStack(alignment: .leading, spacing:0){
            
            if preventionItem.id == 1 {
                PreventionHandsView()
            } else if preventionItem.id == 2   {
                Text("Hello,TOÂ \(preventionItem.id)!")
            } else if preventionItem.id == 3 {
                Text("Hello,TOÂ \(preventionItem.id)!")
                Text("Image, TOÂ \(preventionItem.id)!")
            } else if preventionItem.id == 4 {
                Text("Hello, TOÂ \(preventionItem.id)!")
                Text("Image,TOÂ \(preventionItem.id)!")
            } else if preventionItem.id == 5 {
                Text("Hello, TOÂ \(preventionItem.id)!")
                Text("Image, TOÂ \(preventionItem.id)!")
            } else if preventionItem.id == 6 {
                Text("Hello, TOÂ \(preventionItem.id)!")
                Text("Image, TOÂ \(preventionItem.id)!")
            } else {
                PreventionDeathsView() 
            }
            
        }
        
    }
}

struct PreventionDetailControlerView_Previews: PreviewProvider {
    static var previews: some View {
        
        //index 2 for test purpose
        PreventionDetailControlerView(preventionItem: Prevention(id: 1, title: "nil", lottieFileName: "nil"), preventionOptionIndex: 2)
    }
}
