//
//  ResultPositiveView.swift
//  TOA
//
//  Created by Steven on 7/18/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct ResultPositiveView: View {
    @Binding var isShowing: Int //parent view controller
    
    var body: some View {
        Text("Hell positive !")
    }
}

struct ResultPositiveView_Previews: PreviewProvider {
    @State static var isShowing: Int = 6
    
    static var previews: some View {
        ResultPositiveView(isShowing: self.$isShowing)
    }
}
