//
//  CustomImage.swift
//  TOA
//
//  Created by Steven on 7/6/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI

struct CustomImage : View {
    
    private var isResizable = false
    private var fileName : String

    var body: some View {
        let image = Image(fileName)
        return isResizable ? image.resizable() : image
    }

    func resizable() -> CustomImage {
        return CustomImage(isResizable: true, fileName: "")
    }
}
 
