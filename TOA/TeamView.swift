//
//  TeamView.swift
//  TOA
//
//  Created by Steven on 7/20/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI
import SwiftDrawer

struct TeamView: View, SliderProtocol {
    
    @EnvironmentObject public var control: DrawerControl
    
     let type: SliderType
     init(type: SliderType) {
        self.type = type
     }
    
    var body: some View {
        VStack{
            Text("welcome")
        }.background( Color("colorDrawer") )
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(type: .leftRear)
    }
}
