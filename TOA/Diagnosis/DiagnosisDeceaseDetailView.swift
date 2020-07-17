//
//  DiagnosisDeceaseDetailView.swift
//  TOA
//
//  Created by Steven on 7/17/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct DiagnosisDeceaseDetailView: View {
    
    var decease : Decease
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DiagnosisDeceaseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiagnosisDeceaseDetailView(decease: Decease(id: 1, decease: "Diabète"))
    }
}
