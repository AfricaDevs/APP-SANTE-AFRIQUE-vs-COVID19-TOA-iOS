//
//  ResultNegativeView.swift
//  TOA
//
//  Created by Steven on 7/18/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct ResultNegativeView: View {
    @Binding var isShowing: Int //parent view controller
    
    var body: some View {
        Text("Hello Nagative")
    }
}

struct ResultNegativeView_Previews: PreviewProvider {
    @State static var isShowing: Int = 7
    
    static var previews: some View {
        ResultNegativeView(isShowing: self.$isShowing)
    }
}
